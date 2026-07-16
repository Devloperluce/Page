-- 빅스데이터 교육센터 — 문의/소개서 요청 테이블
-- Supabase 대시보드 → SQL Editor 에 붙여넣고 실행하세요.

-- 1) 교육 문의
create table if not exists public.inquiries (
  id          bigint generated always as identity primary key,
  created_at  timestamptz not null default now(),
  company     text not null,          -- 회사명
  name        text not null,          -- 담당자명
  email       text not null,          -- 이메일(필수)
  phone       text,                   -- 연락처(선택)
  course      text,                   -- 관심 과정
  message     text,                   -- 문의 내용
  user_agent  text,
  status      text not null default 'new'   -- new / contacted / done 등 운영용
);

-- 2) 교육 소개서 요청
create table if not exists public.brochure_requests (
  id          bigint generated always as identity primary key,
  created_at  timestamptz not null default now(),
  company     text not null,          -- 회사명
  dept        text not null,          -- 부서
  name        text not null,          -- 이름
  email       text not null,          -- 소개서 받을 이메일
  user_agent  text,
  sent        boolean not null default false  -- PDF 발송 완료 여부
);

-- 조회 편의를 위한 인덱스
create index if not exists idx_inquiries_created on public.inquiries (created_at desc);
create index if not exists idx_brochure_created on public.brochure_requests (created_at desc);

-- RLS 활성화: 서버(service_role 키)만 접근하도록 하고 공개 접근은 차단.
-- (service_role 키는 RLS를 우회하므로 서버리스 함수의 insert/update는 정상 동작합니다.
--  정책을 따로 만들지 않으면 anon/public 클라이언트는 접근 불가 → 안전합니다.)
alter table public.inquiries enable row level security;
alter table public.brochure_requests enable row level security;
