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

-- 달바글로벌 사례는 실제 원문(bigxdata.io/education_intro?bmode=view&idx=170272598)을 그대로 반영했습니다.
insert into public.cases
  (badge, title, company, published_date, views, banner_eyebrow, banner_title, banner_sub, logo_text, body_text, status)
values (
  '공지',
  '[달바글로벌] 현업 맞춤 닥터 세션 (QnA 교육)',
  '달바글로벌',
  '2025-03-24',
  232,
  '교육 사례 후기',
  '【달바글로벌】 현업 맞춤 닥터 세션 (QnA 교육)',
  'BigxData (빅스데이터) | bigxdata.io',
  E'd''Alba piedmont',
  E'빅스데이터(BigxData)는 데이터와 AI로 새로운 경험을 만드는 기업입니다.\n태블로(Tableau) 라이선스 공급, 프리미어 서비스, 기업 맞춤 교육을 통합 제공하며, 국내 주요 기업과 기관의 데이터 기반 의사결정 문화를 함께 만들어가고 있습니다.\n\n이 문서에서는 글로벌 뷰티 브랜드 달바글로벌과 함께한 Tableau 닥터 세션(QnA 교육) 사례를 소개합니다. 사전 수렴한 현업 질문 기반으로 진행된 맞춤형 교육으로, 참가자들의 높은 만족도와 즉각적인 업무 활용 의지가 확인된 사례입니다.\n\n📋 교육 개요\n- 고객사: 달바글로벌 (d''Alba Global)\n- 교육 일시: 2025년 3월 24일(월) 14:00 ~ 18:00\n- 교육 장소: 달바글로벌 본사 회의실\n- 총 교육 시간: 4시간\n- 총 참가 인원: 9명 (그로스마케팅팀)\n- 교육 형태: 닥터 세션 (사전 질문 기반 QnA 교육)\n- 교육 수준: 기초~중급 (비즈니스 지표 즉시 활용 중심)\n\n📚 교육 커리큘럼 — 닥터 세션 (사전 질문 기반 QnA 집중 교육, 2025.3.24)\n- 사전 수렴 25개 질문 기반 워크북 실습\n- 비즈니스 지표 뽑기 (매개변수·계산식)\n- 구글 시트 연동 데이터 활용 및 태블로 전환 방법\n- 대시보드 실무 활용 사례 Q&A\n- 주요 반응: 닥터 세션 유료 과정 첫 진행 → 높은 만족도로 추가 1회 진행 확정. 비즈니스에서 즉각 지표를 뽑는 방법에 대한 현업 수요 높음\n\n💬 교육 성과 및 참가자 반응\n달바글로벌 교육은 그로스마케팅팀 대상 닥터 세션으로 사전에 제출한 25개 현업 질문을 중심으로 진행되었습니다. 강의 형태가 아닌 문제 해결 중심의 실습으로 운영하여 참가자들의 높은 몰입도와 실무 적용 의지를 이끌어냈습니다.\n\n"비즈니스에서 즉각적으로 지표를 뽑는 방법을 체계적으로 배울 수 있었고, 현업 질문에 맞춰 진행되니 바로 적용하기가 훨씬 수월했습니다." — 그로스마케팅팀 참가자 반응 종합\n\n사전 수렴한 25개 질문 중 20개는 사전 제작 워크북으로 준비하여, 9명이 함께 문제를 풀어가는 강의 형태로 진행함으로써 개인 질의를 넘어선 팀 전체의 역량 향상이 이루어졌습니다. 그로스마케팅팀 9명 전원이 Creator 계정을 보유하고 있어 직접 뷰를 제작하고 있으며, 이사님이 만든 대시보드를 대표에게 직접 보고하는 등 Tableau가 핵심 보고 도구로 자리잡고 있습니다.\n\n🔄 고객사 도입 여정\n1. 공인 교육 이수 — 태블로 공인 교육 TTD101·201 수료\n2. 라이선스 도입 — Creator 9명 + Viewer 전사 도입으로 팀 내 Tableau 정착\n3. 프로젝트 진행 — 그로스마케팅 데이터 기반 대시보드 구축 및 대표 직보\n4. 닥터 세션 (교육) — 현업 질문 기반 QnA 교육으로 팀 역량 고도화 및 추가 세션 확정\n\n🎯 BigxData 교육 방법론\n- 사전 질문 기반 맞춤형 설계: 참가자 25개 현업 질문을 사전 수렴하여 워크북을 직접 제작, 9명이 함께 풀어가는 형태로 개인 코칭과 팀 교육 효과를 동시에 달성\n- 현업 즉시 적용 중심 실습: 샘플 데이터가 아닌 달바글로벌 실제 비즈니스 지표(마케팅·매출·구글 시트 데이터)로 실습\n- 타사 사례 연계 활용: 타사의 Tableau 활용 사례를 통해 조직 내 데이터 문화 확산 동기 부여\n- 변화 관리 파트너: 단순 도구 교육을 넘어 모바일 대시보드 고도화, Tableau AI 도입 로드맵까지 함께 설계하는 장기 파트너십 지향',
  'published'
);

-- ── 참고: 이미 위 INSERT(짧은 버전)를 실행하셨다면, 아래 UPDATE로 본문만 교체할 수 있습니다 ──
-- update public.cases set
--   company = '달바글로벌', published_date = '2025-03-24', views = 232,
--   body_text = (여기에 위 body_text 값을 그대로 붙여넣기)
-- where title = '[달바글로벌] 현업 맞춤 닥터 세션 (QnA 교육)';
