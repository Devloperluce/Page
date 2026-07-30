-- ══════════════════════════════════════════════════════════
-- 교육현장 게시판 (Cases) 스키마
-- Supabase → SQL Editor 에 붙여넣고 실행하세요.
-- (db/schema.sql, db/member_schema.sql 이 먼저 실행된 상태여야 합니다 — profiles.role 사용)
-- ══════════════════════════════════════════════════════════

create table if not exists public.cases (
  id              bigint generated always as identity primary key,
  badge           text not null default '공지',
  title           text not null,          -- 목록에 보이는 제목 (예: [HMM] 변화 관리 위원 대상 ...)
  company         text,                   -- 참고용 회사/기관명
  published_date  date not null default current_date,
  views           integer not null default 0,
  banner_eyebrow  text default '교육 사례 후기',
  banner_title    text,                   -- 상세 배너 안 굵은 제목 (없으면 title 사용)
  banner_sub      text default 'BigxData (빅스데이터) | bigxdata.io',
  logo_text       text,                   -- 이미지 없을 때 텍스트 로고 (예: d'Alba piedmont)
  logo_url        text,                   -- 실제 로고 이미지가 있으면 URL
  body_text       text,                   -- 상세 본문 (줄바꿈은 \n\n 로 문단 구분)
  status          text not null default 'published',  -- 'published' | 'draft'
  created_at      timestamptz not null default now(),
  updated_at      timestamptz not null default now()
);

alter table public.cases enable row level security;

-- 공개(비로그인 포함) 조회: 게시(published)된 것만
create policy "public read published cases"
  on public.cases for select
  using (status = 'published');

-- 관리자만 조회(초안 포함)/작성/수정/삭제
create policy "admin read all cases" on public.cases for select to authenticated
  using (exists (select 1 from public.profiles p where p.id = auth.uid() and p.role = 'admin'));
create policy "admin insert cases" on public.cases for insert to authenticated
  with check (exists (select 1 from public.profiles p where p.id = auth.uid() and p.role = 'admin'));
create policy "admin update cases" on public.cases for update to authenticated
  using (exists (select 1 from public.profiles p where p.id = auth.uid() and p.role = 'admin'));
create policy "admin delete cases" on public.cases for delete to authenticated
  using (exists (select 1 from public.profiles p where p.id = auth.uid() and p.role = 'admin'));

create index if not exists idx_cases_published on public.cases (published_date desc);

-- ── 기존에 확인된 실제 게시물 8건 시드 ──
insert into public.cases (badge, title, published_date, views, status) values
  ('공지', '[HMM] 변화 관리 위원 대상 사내 강사 육성 프로그램', '2026-03-13', 14, 'published'),
  ('공지', '[NH투자증권] 고객 행동 데이터 기반 실무 집중 교육', '2026-03-11', 19, 'published'),
  ('공지', '[HMM] 데이터 기반 변화 관리 교육', '2026-03-05', 30, 'published'),
  ('공지', '[숙명여자대학교] 2025 빅데이터 융합 윈터스쿨 온오프라인 교육 및 해커톤', '2026-03-05', 25, 'published'),
  ('공지', '[BNK 경남은행] 금융 현업 데이터 기반 태블로 실습 교육', '2026-03-05', 22, 'published'),
  ('공지', '[가천대학교] G-STAR 데이터 분석 역량 강화 교육', '2026-03-05', 27, 'published'),
  ('공지', '[11번가] Tableau 중급·고급 현업 맞춤 집중 교육', '2026-03-05', 19, 'published');

-- 달바글로벌 사례는 실제 상세 내용이 있어 별도로 채워 넣습니다.
insert into public.cases
  (badge, title, published_date, views, banner_eyebrow, banner_title, banner_sub, logo_text, body_text, status)
values (
  '공지',
  '[달바글로벌] 현업 맞춤 닥터 세션 (QnA 교육)',
  '2026-03-05',
  231,
  '교육 사례 후기',
  '【달바글로벌】 현업 맞춤 닥터 세션 (QnA 교육)',
  'BigxData (빅스데이터) | bigxdata.io',
  E'd''Alba piedmont',
  E'빅스데이터(BigxData)는 데이터와 AI로 새로운 경험을 만드는 기업입니다.\n태블로(Tableau) 라이선스 공급, 프리미어 서비스, 기업 맞춤 교육을 통합 제공하며, 국내 주요 기업과 기관의 데이터 기반 의사결정 문화를 함께 만들어가고 있습니다.',
  'published'
);
