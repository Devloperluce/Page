# 빅스데이터 교육센터 — 배포 & 문의 DB 가이드

정적 사이트(`index.html`) + Vercel 서버리스 API(`/api/*`)로 구성되어 있습니다.
- 교육 문의 → `POST /api/inquiry` → Supabase `inquiries` 테이블 저장 (+ 담당자 알림 메일)
- 소개서 요청 → `POST /api/brochure` → Supabase `brochure_requests` 저장 + 요청 이메일로 PDF 발송

```
education-site/
├─ index.html            # 사이트 (이 파일이 배포되는 실제 소스)
├─ api/
│  ├─ inquiry.js         # 교육 문의 저장 + 알림
│  └─ brochure.js        # 소개서 요청 저장 + PDF 메일
├─ lib/supabase.js       # Supabase 클라이언트(서버 전용)
├─ db/schema.sql         # 테이블 정의
├─ assets/               # education-brochure.pdf 를 여기에 넣기
├─ package.json
├─ vercel.json
└─ .env.example
```

---

## 1. Supabase 준비 (문의 저장)

1. https://supabase.com 가입 → **New project** 생성 (Region: Seoul 권장).
2. 좌측 **SQL Editor** → `db/schema.sql` 내용 붙여넣고 **Run**. → `inquiries`, `brochure_requests` 테이블 생성.
3. **Project Settings → API** 에서 아래 두 값 복사:
   - `Project URL`  → `SUPABASE_URL`
   - `service_role` **secret** 키 → `SUPABASE_SERVICE_ROLE_KEY`  *(anon 키 아님, 서버 전용)*
4. 저장된 문의 확인: **Table Editor → inquiries** (필터·정렬 가능), 내보내기는 상단 **Export → CSV**.

## 2. Resend 준비 (이메일 발송)

1. https://resend.com 가입 → **API Keys → Create** → `RESEND_API_KEY`.
2. **Domains → Add Domain** 에 `bigxdata.io` 추가 후 안내된 DNS(SPF/DKIM) 등록. 인증되면
   `education@bigxdata.io` 같은 주소로 발송 가능 → `MAIL_FROM` 에 사용.
   - (도메인 인증 전 테스트는 Resend 제공 `onboarding@resend.dev` 로도 가능)
3. 소개서 PDF 준비: `assets/education-brochure.pdf` 파일을 넣어주세요.

## 3. 환경변수

`.env.example` 참고. 로컬 테스트는 `education-site/.env` 에, 배포는 Vercel 대시보드에 등록:

| 변수 | 설명 |
|---|---|
| `SUPABASE_URL` | Supabase Project URL |
| `SUPABASE_SERVICE_ROLE_KEY` | service_role 키 (서버 전용) |
| `RESEND_API_KEY` | Resend API 키 |
| `MAIL_FROM` | 발신 주소 (예: `빅스데이터 교육센터 <education@bigxdata.io>`) |
| `NOTIFY_EMAIL` | 새 문의 알림 받을 주소 (예: `support@bigxdata.io`) |
| `BROCHURE_URL` | (선택) 소개서 PDF 절대 URL |

## 4. Vercel 배포

**방법 A — 대시보드(권장)**
1. 이 폴더를 GitHub 저장소에 올립니다.
2. https://vercel.com → **Add New → Project** → 저장소 선택.
3. **Root Directory** 를 `education-site` 로 지정 (모노레포일 경우).
4. **Environment Variables** 에 위 표의 값 등록 → **Deploy**.

**방법 B — CLI**
```bash
cd education-site
npm i              # 의존성 설치
npm i -g vercel
vercel             # 최초 배포(프로젝트 연결)
vercel env add SUPABASE_URL        # 이하 변수들 등록
# ...나머지 변수 등록...
vercel --prod      # 프로덕션 배포
```

## 5. 도메인 연결 (선택)

Vercel 프로젝트 **Settings → Domains** 에 `edu.bigxdata.io` 등 추가 후, 도메인 DNS에 안내된 CNAME 등록.

---

## 동작 확인 체크리스트
- [ ] 교육문의 폼 제출 → Supabase `inquiries` 에 행 추가 + `NOTIFY_EMAIL` 로 알림 도착
- [ ] 소개서 받기 폼 제출 → `brochure_requests` 에 행 추가 + 입력 이메일로 PDF 첨부 메일 도착
- [ ] `assets/education-brochure.pdf` 존재 확인

## 참고 / 주의
- `service_role` 키와 `RESEND_API_KEY` 는 **절대 클라이언트(HTML)·깃에 노출 금지**. Vercel 환경변수로만 관리.
- 메일 설정 전이라도 문의/요청 **저장은 정상 동작**합니다(발송만 스킵).
- 대량 스팸 방지가 필요하면 이후 reCAPTCHA/hCaptcha 또는 rate limit 추가를 권장합니다.
