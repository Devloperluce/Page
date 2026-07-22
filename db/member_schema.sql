-- ══════════════════════════════════════════════════════════
-- 회원 영역 스키마 (Phase 2)
-- Supabase → SQL Editor 에 붙여넣고 실행하세요.
-- (db/schema.sql 을 먼저 실행한 상태여야 합니다)
-- ══════════════════════════════════════════════════════════

-- 1) 프로필 (auth.users 와 1:1)
create table if not exists public.profiles (
  id         uuid primary key references auth.users(id) on delete cascade,
  email      text,
  name       text,
  company    text,
  dept       text,
  phone      text,
  role       text not null default 'member',   -- 'member' | 'admin'
  created_at timestamptz not null default now()
);
alter table public.profiles enable row level security;

create policy "own profile read"   on public.profiles for select to authenticated using (auth.uid() = id);
create policy "own profile update" on public.profiles for update to authenticated using (auth.uid() = id);
create policy "own profile insert" on public.profiles for insert to authenticated with check (auth.uid() = id);

-- 가입 시 프로필 자동 생성 (name/company 는 회원가입 시 metadata 로 전달)
create or replace function public.handle_new_user()
returns trigger language plpgsql security definer set search_path = public as $$
begin
  insert into public.profiles (id, email, name, company)
  values (new.id, new.email, new.raw_user_meta_data->>'name', new.raw_user_meta_data->>'company')
  on conflict (id) do nothing;
  return new;
end; $$;
drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();

-- 2) 수강 신청
create table if not exists public.enrollments (
  id         bigint generated always as identity primary key,
  user_id    uuid not null references auth.users(id) on delete cascade,
  course     text not null,
  message    text,
  status     text not null default 'requested',  -- requested | contacted | done
  created_at timestamptz not null default now()
);
alter table public.enrollments enable row level security;
create policy "own enrollments read"   on public.enrollments for select to authenticated using (auth.uid() = user_id);
create policy "own enrollments insert" on public.enrollments for insert to authenticated with check (auth.uid() = user_id);

-- 3) 회원 전용 자료실
create table if not exists public.materials (
  id          bigint generated always as identity primary key,
  title       text not null,
  description text,
  category    text,
  file_url    text,
  created_at  timestamptz not null default now()
);
alter table public.materials enable row level security;
create policy "auth read materials" on public.materials for select to authenticated using (true);

-- ── 4) 관리자 접근 재정의 (개인정보 보호) ──
-- 기존 '모든 인증자 조회' 정책 제거 → 관리자(role='admin')만 전체 조회
drop policy if exists "authenticated read inquiries" on public.inquiries;
drop policy if exists "authenticated read brochure"  on public.brochure_requests;

create policy "admin read inquiries" on public.inquiries for select to authenticated
  using (exists (select 1 from public.profiles p where p.id = auth.uid() and p.role = 'admin'));
create policy "admin read brochure"  on public.brochure_requests for select to authenticated
  using (exists (select 1 from public.profiles p where p.id = auth.uid() and p.role = 'admin'));
create policy "admin read enrollments" on public.enrollments for select to authenticated
  using (exists (select 1 from public.profiles p where p.id = auth.uid() and p.role = 'admin'));

-- 회원은 본인 이메일로 접수된 교육 문의를 조회 가능
create policy "own inquiries read" on public.inquiries for select to authenticated
  using (lower(email) = lower(auth.jwt() ->> 'email'));

-- ── 5) 관리자 계정 지정 ──
-- 이미 만든 관리자 이메일을 admin 으로 승격 (이메일을 실제 값으로 바꿔 실행)
--   insert into public.profiles (id, email, role)
--   select id, email, 'admin' from auth.users where email = '관리자이메일@bigxdata.io'
--   on conflict (id) do update set role = 'admin';
