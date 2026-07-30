-- ══════════════════════════════════════════════════════════
-- 교육현장(Cases) 7건 상세 본문 업데이트
-- Supabase → SQL Editor 에 붙여넣고 실행하세요.
-- (기존 8건 시드가 이미 들어가 있는 상태에서, title 기준으로 body_text만 채웁니다)
-- ══════════════════════════════════════════════════════════

-- 1) [HMM] 변화 관리 위원 대상 사내 강사 육성 프로그램
update public.cases set company = 'HMM', views = 341, body_text = '<p>HMM 변화관리위원(Tier 1) 4명을 사내 강사로 육성하기 위한 집중 프로그램입니다. HMM 실무 데이터를 활용한 심화 실습과 교수법 안내를 병행했습니다.</p>
<h3>📋 교육 개요</h3>
<table>
<tr><td>고객사</td><td>HMM</td></tr>
<tr><td>교육 기간</td><td>2026년 2월 25일 ~ 3월 12일 (총 4회차)</td></tr>
<tr><td>총 교육 시간</td><td>12시간 (3시간 × 4회차)</td></tr>
<tr><td>교육 수준</td><td>Tableau 기초~심화 / 교수법 안내</td></tr>
<tr><td>교육 방식</td><td>집합 교육 + 1 on 1 닥터 세션(예정)</td></tr>
</table>
<h3>💬 교육 성과</h3>
<p>IT·데이터 배경의 Tier 1 수강생 4명이 기초 시각화부터 대시보드 설계·교수법까지 전 과정을 이수했습니다. 모든 실습은 HMM 실무 데이터를 기반으로 진행되어 실무 적용 가능성을 높였습니다.</p>
<blockquote>"참여한 분들의 만족도가 매우 높습니다."<br>— HMM 담당자</blockquote>
<ul>
<li>4회차 전 일정 이탈자 없이 높은 참여도 유지</li>
<li>IT 배경에 맞춘 설명 방식으로 빠른 개념 습득 확인</li>
<li>내부 강사 자가 진단 체크리스트로 동료 교육 수행 기반 마련</li>
</ul>
<h3>🔄 고객사 도입 여정</h3>
<div class="case-steps">
<div class="cs-step"><div class="cs-num">STEP 1</div><div class="cs-title">기초·심화·부산 교육</div><div class="cs-desc">조별 기초·심화 교육 및 부산 압축 과정으로 전사 기반 역량 구축</div></div>
<div class="cs-step"><div class="cs-num">STEP 2</div><div class="cs-title">변화관리위원 육성</div><div class="cs-desc">심화 시각화·계산식·교수법 안내로 사내 강사 역량 내재화</div></div>
<div class="cs-step"><div class="cs-num">STEP 3</div><div class="cs-title">1 on 1 닥터 세션</div><div class="cs-desc">개인별 맞춤 지도 및 강의 시뮬레이션 점검</div></div>
<div class="cs-step"><div class="cs-num">STEP 4</div><div class="cs-title">데이터 문화 정착</div><div class="cs-desc">변화관리위원이 동료 대상 자체 교육 진행, 전사 데이터 문화 정착</div></div>
</div>
<h3>🎯 BigxData 교육 방법론</h3>
<table>
<tr><td>실무 데이터 중심 실습</td><td>HMM 실제 업무 데이터를 기반으로 실습하여 현업 적용성 확보</td></tr>
<tr><td>IT 배경 맞춤형 설명</td><td>SQL 개념에 빗댄 설명으로 데이터 배경 수강생의 직관적 이해 지원</td></tr>
<tr><td>현장 유연 대응</td><td>환경 제약 발생 시 즉시 커리큘럼을 재구성하는 현장 대응력</td></tr>
<tr><td>변화 관리 파트너</td><td>도구 교육을 넘어 내부 확산 전략까지 지원하는 파트너십</td></tr>
</table>
<h3>📞 문의</h3>
<table>
<tr><td>회사명</td><td>BigxData (빅스데이터) | bigxdata.io</td></tr>
<tr><td>담당자</td><td>강승일 이사 (Data eXperience팀)</td></tr>
<tr><td>자격</td><td>Tableau Certified Instructor | Tableau Ambassador 2025 | 국내 유일 태블로 공인 인증 강사</td></tr>
<tr><td>전화</td><td>02-559-5317</td></tr>
<tr><td>메일</td><td>support@bigxdata.io</td></tr>
</table>'
where title = '[HMM] 변화 관리 위원 대상 사내 강사 육성 프로그램';

-- 2) [NH투자증권] 고객 행동 데이터 기반 실무 집중 교육
update public.cases set company = 'NH투자증권', views = 260, body_text = '<p>NH투자증권 디지털사업부와 함께한 2026년 상반기 Tableau 실무 집중 교육입니다. 고객 행동 데이터를 활용한 실습 중심 교육으로 진행됐습니다.</p>
<h3>📋 교육 개요</h3>
<table>
<tr><td>고객사</td><td>NH투자증권</td></tr>
<tr><td>교육 기간</td><td>2026년 3월 9일(월) ~ 10일(화)</td></tr>
<tr><td>총 교육 시간</td><td>14시간 (7시간 × 2일)</td></tr>
<tr><td>총 참가 인원</td><td>연인원 31명 (1일차 14명 / 2일차 17명)</td></tr>
<tr><td>교육 수준</td><td>중급 ~ 고급 (현업 데이터 기반)</td></tr>
<tr><td>교육 연혁</td><td>2023년부터 매해 2회 이상 정기 교육 진행 중</td></tr>
</table>
<h3>💬 교육 성과</h3>
<p>기존 주가 데이터 대신 고객 행동 데이터를 활용해 고객 세그먼트 분석·MTD/PMTD 비교 등 현업 즉시 적용 가능한 실습을 진행했습니다.</p>
<blockquote>"계산식과 매개변수를 확실히 잘 활용했습니다. 4년간 진행한 강의 중 참여도가 제일 좋았습니다."<br>— 강사 강승일</blockquote>
<ul>
<li>2개 그룹 전 회차 이탈자 없이 높은 참여도 유지</li>
<li>고객 세그먼트·MTD 지표 실습으로 즉시 현업 적용 가능한 역량 확보</li>
<li>2023년부터 이어온 정기 파트너십이 신규 기술 영역으로 확장</li>
</ul>
<h3>🔄 고객사 도입 여정</h3>
<div class="case-steps">
<div class="cs-step"><div class="cs-num">STEP 1</div><div class="cs-title">정기 파트너십 구축</div><div class="cs-desc">2023년부터 연 2회 이상 반복 교육으로 신뢰 관계 형성</div></div>
<div class="cs-step"><div class="cs-num">STEP 2</div><div class="cs-title">데이터 소재 업그레이드</div><div class="cs-desc">주가 데이터에서 고객 행동 데이터로 현업 밀착형 실습 전환</div></div>
<div class="cs-step"><div class="cs-num">STEP 3</div><div class="cs-title">신입사원 연수과정</div><div class="cs-desc">신입 사원 연수 과정부터 변화 관리 접목</div></div>
<div class="cs-step"><div class="cs-num">STEP 4</div><div class="cs-title">고수준 역량 내재화</div><div class="cs-desc">계산식·매개변수 심화 실습으로 역대 최고 숙련도 달성</div></div>
</div>
<h3>🎯 BigxData 교육 방법론</h3>
<table>
<tr><td>실무 데이터 중심 실습</td><td>고객 행동 데이터로 세그먼트 분석·비교 지표를 직접 산출</td></tr>
<tr><td>다년간 반복 파트너십</td><td>2023년부터 연 2회 이상 정기 교육으로 역량 단계적 내재화</td></tr>
<tr><td>고수준 맞춤 대응</td><td>참가자 숙련도에 맞춰 심화 과정으로 자연스럽게 조정</td></tr>
<tr><td>변화 관리 파트너</td><td>도구 교육을 넘어 조직의 데이터 문화 진화를 체계적으로 지원</td></tr>
</table>
<h3>📞 문의</h3>
<table>
<tr><td>회사명</td><td>BigxData (빅스데이터) | bigxdata.io</td></tr>
<tr><td>담당자</td><td>강승일 이사 (Data eXperience팀)</td></tr>
<tr><td>자격</td><td>Tableau Certified Instructor | Tableau Ambassador 2025 | 국내 유일 태블로 공인 인증 강사</td></tr>
<tr><td>전화</td><td>02-559-5317</td></tr>
<tr><td>메일</td><td>support@bigxdata.io</td></tr>
</table>'
where title = '[NH투자증권] 고객 행동 데이터 기반 실무 집중 교육';

-- 3) [HMM] 데이터 기반 변화 관리 교육
update public.cases set company = 'HMM', views = 324, body_text = '<p>대한민국 최대 컨테이너 해운사 HMM과 진행 중인 Tableau 기반 데이터 변화 관리 교육입니다. 조직 전반의 데이터 역량 내재화를 목표로 기초부터 사내 강사 육성까지 단계적으로 설계된 장기 파트너십입니다.</p>
<h3>📋 교육 개요</h3>
<table>
<tr><td>고객사</td><td>HMM</td></tr>
<tr><td>교육 기간</td><td>2025년 12월 15일 ~ 2026년 3월 (진행중)</td></tr>
<tr><td>교육 장소</td><td>HMM 본사(서울) / 부산 지사(1박 2일 출장)</td></tr>
<tr><td>총 교육 시간</td><td>총 60시간</td></tr>
<tr><td>누적 참가 인원</td><td>기초·심화 각 회당 약 20명 (A·B·C 3개조), 부산 별도</td></tr>
<tr><td>교육 수준</td><td>기초 → 심화 → 변화관리위원 사내 강사 육성 (단계별)</td></tr>
</table>
<h3>📚 교육 커리큘럼</h3>
<table>
<tr><th>단계</th><th>내용</th><th>비고</th></tr>
<tr><td>기초 교육</td><td>A·B·C 3개조, 회당 2시간 × 2회차 (2025.12)</td><td>Tableau 기본 개념·차트·대시보드</td></tr>
<tr><td>심화 교육</td><td>동일 3개조, 회당 2시간 × 2회차 (2026.1)</td><td>계산식·매개변수 심화, 서버 환경 실습</td></tr>
<tr><td>부산 출장 교육</td><td>1박 2일 집중 과정 (2026.1.28~29)</td><td>기초~심화 압축, 실제 서버 실습</td></tr>
<tr><td>사내 강사 육성</td><td>총 4세션, 각 3시간 (2026.2~3)</td><td>시각화 교육 스킬·변화관리 방법론</td></tr>
</table>
<h3>💬 교육 성과</h3>
<p>서울 본사와 부산 지사를 아우르는 전사 단위 변화 관리 파트너십으로, 기초→심화→사내 강사 육성으로 이어지는 체계적 역량 내재화를 진행 중입니다.</p>
<blockquote>"실제 참관 후 참석자 후기를 들어보니 제안하신 방향이 맞았습니다."<br>— HMM 담당 파트장</blockquote>
<ul>
<li>3개조(A·B·C) 기초·심화 교육 각 2회차 성공적으로 완료</li>
<li>결석자 보완 세션 운영으로 학습 연속성 확보</li>
<li>부산 출장 교육으로 수도권 외 지역 거점까지 동일 수준 교육 기회 제공</li>
<li>향후 해외 거점 온라인 교육으로 확장 예정</li>
</ul>
<h3>🔄 고객사 도입 여정</h3>
<div class="case-steps">
<div class="cs-step"><div class="cs-num">STEP 1</div><div class="cs-title">기초 내재화</div><div class="cs-desc">3개조 각 2회차 기초 교육(12시간) 완료</div></div>
<div class="cs-step"><div class="cs-num">STEP 2</div><div class="cs-title">심화 역량 강화</div><div class="cs-desc">동일 3개조 심화 교육 + 보완 세션</div></div>
<div class="cs-step"><div class="cs-num">STEP 3</div><div class="cs-title">지역 확산</div><div class="cs-desc">부산 1박 2일 출장 교육으로 거점 확대</div></div>
<div class="cs-step"><div class="cs-num">STEP 4</div><div class="cs-title">사내 강사 육성</div><div class="cs-desc">변화관리위원 대상 4회 세션 진행</div></div>
</div>
<h3>🎯 BigxData 교육 방법론</h3>
<table>
<tr><td>조직 갭 분석 기반 설계</td><td>현장 역량과 목표 사이 갭을 진단해 수준별·조별 커리큘럼 설계</td></tr>
<tr><td>현장 참관 및 즉각 피드백</td><td>사전 참관으로 수준을 검토하고 담당자 피드백을 즉시 반영</td></tr>
<tr><td>지역 거점 확장 교육</td><td>수도권 본사 중심에서 부산 지사까지 동일 수준 지원</td></tr>
<tr><td>변화 관리 파트너</td><td>사내 강사 육성, 임원 리더십 세션까지 조직 전반 지원</td></tr>
</table>
<h3>📞 문의</h3>
<table>
<tr><td>회사명</td><td>BigxData (빅스데이터) | bigxdata.io</td></tr>
<tr><td>담당자</td><td>강승일 이사 (Data eXperience팀)</td></tr>
<tr><td>자격</td><td>Tableau Certified Instructor | Tableau Ambassador 2025 | 국내 유일 태블로 공인 인증 강사</td></tr>
<tr><td>전화</td><td>02-559-5317</td></tr>
<tr><td>메일</td><td>support@bigxdata.io</td></tr>
</table>'
where title = '[HMM] 데이터 기반 변화 관리 교육';

-- 4) [숙명여자대학교] 2025 빅데이터 융합 윈터스쿨 온오프라인 교육 및 해커톤
update public.cases set company = '숙명여자대학교', views = 283, body_text = '<p>숙명여자대학교 발주, 컴퍼니더업 수행의 2025 빅데이터 융합 윈터스쿨입니다. 온라인 5회차 교육과 오프라인 2박 3일 해커톤을 결합한 프로그램으로, Tableau를 처음 접한 대학생들이 해커톤까지 완주했습니다.</p>
<h3>📋 교육 개요</h3>
<table>
<tr><td>고객사(발주처)</td><td>숙명여자대학교</td></tr>
<tr><td>참여 학교</td><td>숙명여대·서울시립대·경기과학기술대·한동대</td></tr>
<tr><td>총 참가 인원</td><td>29명</td></tr>
<tr><td>교육 기간</td><td>2024년 12월 29일 ~ 2025년 1월 8일</td></tr>
<tr><td>교육 장소</td><td>온라인(Zoom+Slack) + 오프라인(고양 소노캄)</td></tr>
<tr><td>총 교육 시간</td><td>10시간(온라인) + 2박 3일 해커톤</td></tr>
</table>
<h3>📚 교육 커리큘럼</h3>
<table>
<tr><th>구분</th><th>내용</th><th>비고</th></tr>
<tr><td>온라인 과정</td><td>5회차 × 2시간, Tableau 기초·시각화·대시보드 제작</td><td>매일 과제·피드백·복습 영상 제공</td></tr>
<tr><td>오프라인 해커톤</td><td>2박 3일(고양 소노캄), 팀 단위 데이터 시각화 프로젝트</td><td>강사진 동반 코칭, 전 팀 완주·발표</td></tr>
</table>
<h3>💬 교육 성과</h3>
<p>4개 대학 29명이 다양한 협업 환경 속에서 데이터 시각화 역량을 함양했습니다. 온라인 과정에서는 과제→피드백→복습 영상의 학습 사이클을 운영했고, 해커톤에서는 강사진이 새벽까지 팀별 코칭을 지원했습니다.</p>
<ul>
<li>4개 대학교 학생 29명이 참여해 다양한 협업 환경에서 역량 함양</li>
<li>온라인 5회차 전 과정 체계적 학습 사이클 운영</li>
<li>발주처(숙명여대)로부터 긍정적 피드백 수령, 향후 기준 사례로 활용 예정</li>
</ul>
<h3>🔄 교육 프로그램 여정</h3>
<div class="case-steps">
<div class="cs-step"><div class="cs-num">STEP 1</div><div class="cs-title">프로그램 설계</div><div class="cs-desc">발주처 요구 분석, 커리큘럼 구성 및 수행처 협력 체계 구축</div></div>
<div class="cs-step"><div class="cs-num">STEP 2</div><div class="cs-title">온라인 교육</div><div class="cs-desc">Zoom 5회차 교육, 매일 과제·피드백·복습 영상 제공</div></div>
<div class="cs-step"><div class="cs-num">STEP 3</div><div class="cs-title">해커톤 준비</div><div class="cs-desc">팀별 프로젝트 기획 지원 및 사전 질의응답 대응</div></div>
<div class="cs-step"><div class="cs-num">STEP 4</div><div class="cs-title">오프라인 해커톤</div><div class="cs-desc">2박 3일 집중 과정, 팀 발표 완주 및 긍정 평가로 마무리</div></div>
</div>
<h3>🎯 BigxData 교육 방법론</h3>
<table>
<tr><td>체계적 학습 사이클</td><td>과제→피드백→복습 영상→다음 회차 연계로 학습 연속성 확보</td></tr>
<tr><td>온·오프라인 혼합 설계</td><td>온라인 기초 내재화 후 오프라인 해커톤으로 실전 적용</td></tr>
<tr><td>해커톤 밀착 서포트</td><td>강사진이 해커톤 전 과정에 동반하여 팀별 코칭</td></tr>
<tr><td>변화 관리 파트너</td><td>기획 단계부터 발표 완주까지 전 과정 참여·협력</td></tr>
</table>
<h3>📞 문의</h3>
<table>
<tr><td>회사명</td><td>BigxData (빅스데이터) | bigxdata.io</td></tr>
<tr><td>담당자</td><td>강승일 이사 (Data eXperience팀)</td></tr>
<tr><td>자격</td><td>Tableau Certified Instructor | Tableau Ambassador 2025 | 국내 유일 태블로 공인 인증 강사</td></tr>
<tr><td>전화</td><td>02-559-5317</td></tr>
<tr><td>메일</td><td>support@bigxdata.io</td></tr>
</table>'
where title = '[숙명여자대학교] 2025 빅데이터 융합 윈터스쿨 온오프라인 교육 및 해커톤';

-- 5) [BNK 경남은행] 금융 현업 데이터 기반 태블로 실습 교육
update public.cases set company = 'BNK 경남은행', views = 248, body_text = '<p>BNK 경남은행과 함께한 Tableau 기초 및 Tableau Prep 실습 교육입니다. 금융 현업 데이터를 직접 활용한 실습 중심 교육으로 높은 참여도와 현업 즉시 적용이 확인됐습니다.</p>
<h3>📋 교육 개요</h3>
<table>
<tr><td>고객사</td><td>BNK 경남은행</td></tr>
<tr><td>교육 기간</td><td>2024년 11월 17일·18일 (총 2회차)</td></tr>
<tr><td>교육 장소</td><td>창원 마산 BNK 본점 다목적 회의실</td></tr>
<tr><td>총 교육 시간</td><td>8시간 (4시간 × 2회)</td></tr>
<tr><td>총 참가 인원</td><td>연인원 48명 (1회차 26명 / 2회차 22명)</td></tr>
<tr><td>교육 수준</td><td>기초(입문) → 중급 시각화·Prep 실습</td></tr>
</table>
<h3>📚 교육 커리큘럼</h3>
<table>
<tr><th>회차</th><th>내용</th><th>비고</th></tr>
<tr><td>1회차 (11/17)</td><td>데이터 리터러시, 금융 지주사 주가 데이터 시각화, 대시보드 제작</td><td>26명, 1 on 1 순회 코칭 병행</td></tr>
<tr><td>2회차 (11/18)</td><td>은행별 총자산 비교 시각화, Tableau Prep 전처리·지도 시각화</td><td>22명, 영업점 데이터 결합 실습</td></tr>
</table>
<h3>💬 교육 성과</h3>
<p>기초 시각화에서 출발해 Tableau Prep을 활용한 영업점 데이터 전처리 및 지도 시각화까지 2일 연속으로 소화한 현업 밀착형 교육입니다. 금융 지주사 주가·총자산 등 실제 업무 데이터를 교육 소재로 삼아 몰입도를 높였습니다.</p>
<blockquote>"경남은행에 맞춘 데이터로 강의를 준비해주셔서 감사합니다. 내년에도 다시 연락드리겠습니다."<br>— 2회차 교육 참가자</blockquote>
<ul>
<li>1·2회차 전 과정 이탈 없이 높은 참여도 유지</li>
<li>현업 데이터 기반 실습으로 교육 직후 업무 적용 가능한 역량 확보</li>
<li>라이선스 확대 및 1주일 집중 교육 모델 논의로 이어짐</li>
</ul>
<h3>🔄 고객사 도입 여정</h3>
<div class="case-steps">
<div class="cs-step"><div class="cs-num">STEP 1</div><div class="cs-title">기초 교육 진입</div><div class="cs-desc">내부 모집 인원 및 인턴 대상 기초 입문</div></div>
<div class="cs-step"><div class="cs-num">STEP 2</div><div class="cs-title">현업 데이터 심화</div><div class="cs-desc">금융 지주사 주가·총자산 등 실데이터 기반 시각화 심화</div></div>
<div class="cs-step"><div class="cs-num">STEP 3</div><div class="cs-title">Prep 전처리 실습</div><div class="cs-desc">경남은행 영업점 데이터 결합·지도 시각화 적용</div></div>
<div class="cs-step"><div class="cs-num">STEP 4</div><div class="cs-title">지속 파트너십</div><div class="cs-desc">라이선스 확대 계획 및 재교육 논의</div></div>
</div>
<h3>🎯 BigxData 교육 방법론</h3>
<table>
<tr><td>금융 특화 데이터 활용</td><td>지주사 주가·영업점 데이터 등 현업 데이터로 실습</td></tr>
<tr><td>1 on 1 현장 코칭</td><td>강사가 개별 순회하며 즉석 코칭 진행</td></tr>
<tr><td>피드백 기반 수준 조정</td><td>1차 관찰 결과를 바탕으로 2차 커리큘럼 즉석 조정</td></tr>
<tr><td>변화 관리 파트너</td><td>라이선스 확대, 집중 교육 모델 제안 등 문화 정착 지원</td></tr>
</table>
<h3>📞 문의</h3>
<table>
<tr><td>회사명</td><td>BigxData (빅스데이터) | bigxdata.io</td></tr>
<tr><td>담당자</td><td>강승일 이사 (Data eXperience팀)</td></tr>
<tr><td>자격</td><td>Tableau Certified Instructor | Tableau Ambassador 2025 | 국내 유일 태블로 공인 인증 강사</td></tr>
<tr><td>전화</td><td>02-559-5317</td></tr>
<tr><td>메일</td><td>support@bigxdata.io</td></tr>
</table>'
where title = '[BNK 경남은행] 금융 현업 데이터 기반 태블로 실습 교육';

-- 6) [가천대학교] G-STAR 데이터 분석 역량 강화 교육
update public.cases set company = '가천대학교', views = 235, body_text = '<p>가천대학교와 함께한 G-STAR 데이터 분석 역량 강화 교육(40시간)입니다. 대학 교직원·교수 대상으로 실제 학생 설문 데이터와 부서 KPI 데이터를 활용한 PBL 기반 교육으로, 전 세션을 완료했습니다.</p>
<h3>📋 교육 개요</h3>
<table>
<tr><td>고객사</td><td>가천대학교</td></tr>
<tr><td>교육 기간</td><td>2025년 11월 19일 ~ 2026년 1월 22일 (4개 주제)</td></tr>
<tr><td>교육 장소</td><td>가천대학교 가천관(대학본부) 회의실</td></tr>
<tr><td>총 교육 시간</td><td>40시간 (주제별 4회차 × 2.5시간 × 4주제)</td></tr>
<tr><td>총 참가 인원</td><td>교직원·교수 대상, 주제별 6~7명</td></tr>
<tr><td>교육 수준</td><td>기초 입문 + Prep 전처리 → 심화 실습 → PBL</td></tr>
</table>
<h3>📚 교육 커리큘럼</h3>
<table>
<tr><th>주제</th><th>주제명</th></tr>
<tr><td>주제 1</td><td>프로그램 참여 및 만족도 분석</td></tr>
<tr><td>주제 2</td><td>부서별 KPI 관리</td></tr>
<tr><td>주제 3</td><td>사전-사후 설문 분석을 통한 프로그램 효과성 분석</td></tr>
<tr><td>주제 4</td><td>특정 항목의 연도별 변화 추이</td></tr>
</table>
<p>각 주제는 실습 2회 + PBL(Project-Based Learning) 2회로 구성되어, 데이터 리터러시부터 Tableau Prep 전처리, Desktop 대시보드 제작, 실제 분석 과제 수행까지 이어졌습니다.</p>
<h3>💬 교육 성과</h3>
<p>교직원·교수를 대상으로 한 40시간 규모의 데이터 분석·시각화 과정으로, 실제 업무 데이터를 활용해 전 세션을 이탈 없이 완료했습니다.</p>
<blockquote>"실제 우리 설문 데이터로 직접 분석하고 대시보드를 만들어보니 보고서 작성 방식을 바꿀 수 있겠다는 자신감이 생겼습니다."<br>— 가천대학교 교육 참가자(교직원)</blockquote>
<ul>
<li>4개 주제 40시간 전 세션 이탈 없이 완료</li>
<li>교직원·교수 참가자 모두 본인 업무 데이터로 분석 결과를 직접 도출</li>
<li>PBL 방식으로 실제 분석 과제 자율 수행 및 개별 코칭 진행</li>
</ul>
<h3>🎯 BigxData 교육 방법론</h3>
<table>
<tr><td>실제 업무 데이터 활용</td><td>학생 설문·부서 KPI 등 실제 데이터로 실습해 즉시 업무 적용 가능</td></tr>
<tr><td>PBL 기반 설계</td><td>이론·실습 이후 실제 과제를 자율 수행하는 프로젝트 학습 구조</td></tr>
<tr><td>장기 다주제 운영</td><td>4개 주제를 독립 코호트로 운영해 부서별 맞춤 학습 지원</td></tr>
<tr><td>변화 관리 파트너</td><td>대학 조직 내 데이터 기반 의사결정 문화 확산 지원</td></tr>
</table>
<h3>📞 문의</h3>
<table>
<tr><td>회사명</td><td>BigxData (빅스데이터) | bigxdata.io</td></tr>
<tr><td>담당자</td><td>강승일 이사 (Data eXperience팀)</td></tr>
<tr><td>자격</td><td>Tableau Certified Instructor | Tableau Ambassador 2025 | 국내 유일 태블로 공인 인증 강사</td></tr>
<tr><td>전화</td><td>02-559-5317</td></tr>
<tr><td>메일</td><td>support@bigxdata.io</td></tr>
</table>'
where title = '[가천대학교] G-STAR 데이터 분석 역량 강화 교육';

-- 7) [11번가] Tableau 중급·고급 현업 맞춤 집중 교육
update public.cases set company = '11번가', views = 198, body_text = '<p>11번가와 함께한 Tableau 중급·고급 집중 교육입니다. 현업 데이터와 실무 요구 사항을 반영해 커리큘럼을 즉석 조정하고, 참가자들의 높은 학습 의지가 돋보인 사례입니다.</p>
<h3>📋 교육 개요</h3>
<table>
<tr><td>고객사</td><td>11번가</td></tr>
<tr><td>교육 기간</td><td>2025년 2월 19일 ~ 27일 (2개조 × 2회차)</td></tr>
<tr><td>교육 장소</td><td>광명역 11번가 본사 강의장</td></tr>
<tr><td>총 교육 시간</td><td>20시간 (5시간 × 4회차)</td></tr>
<tr><td>총 참가 인원</td><td>연인원 약 32명 (A조 17명 + B조 15명)</td></tr>
<tr><td>교육 수준</td><td>중급 + 고급 (조별 2일 연속 집중)</td></tr>
</table>
<h3>📚 교육 커리큘럼</h3>
<table>
<tr><th>구분</th><th>내용</th></tr>
<tr><td>A조 1차 (중급)</td><td>매개변수·계산식 활용 지표 뽑기, 현업 니즈 기반 커리큘럼 즉석 조정</td></tr>
<tr><td>A조 2차 (고급)</td><td>날짜 계산 함수 기반 세일즈 대시보드, LoD 계산(FIXED·INCLUDE·EXCLUDE)</td></tr>
<tr><td>B조 1차 (중급)</td><td>이중 축·필터 드릴다운, URL 호출 및 피그마 연동 대시보드</td></tr>
<tr><td>B조 2차 (고급)</td><td>계산식·복합 매개변수 비즈니스 대시보드 실습 및 전체 Wrap-up</td></tr>
</table>
<h3>💬 교육 성과</h3>
<p>A·B 두 조가 중급→고급 2일 연속 과정을 각각 소화했습니다. 참가자들이 교육 내용을 현업에서 바로 활용하려는 의지를 강하게 보여, 커리큘럼을 현장에서 즉흥 조정하는 대응이 주효했습니다.</p>
<ul>
<li>2개조 전 회차 이탈자 없이 열정적인 참여 유지</li>
<li>현업에서 자주 쓰는 날짜 함수·LoD·복합 매개변수를 실데이터로 실습</li>
<li>사전 질문 수렴 기반 QnA 교육 방식 추가 제안 및 논의</li>
</ul>
<h3>🎯 BigxData 교육 방법론</h3>
<table>
<tr><td>현업 맞춤 즉석 조정</td><td>참가자 반응을 보고 커리큘럼을 현장에서 즉시 재구성</td></tr>
<tr><td>실무 데이터 중심 실습</td><td>실제 프로모션·세일즈 데이터로 계산식·LoD 실습</td></tr>
<tr><td>조별 단계 설계</td><td>중급→고급 2일 연속 구성으로 실무 적용 역량 완성</td></tr>
<tr><td>변화 관리 파트너</td><td>QnA 교육 방식 등 후속 교육 모델까지 함께 논의</td></tr>
</table>
<h3>📞 문의</h3>
<table>
<tr><td>회사명</td><td>BigxData (빅스데이터) | bigxdata.io</td></tr>
<tr><td>담당자</td><td>강승일 이사 (Data eXperience팀)</td></tr>
<tr><td>자격</td><td>Tableau Certified Instructor | Tableau Ambassador 2025 | 국내 유일 태블로 공인 인증 강사</td></tr>
<tr><td>전화</td><td>02-559-5317</td></tr>
<tr><td>메일</td><td>support@bigxdata.io</td></tr>
</table>'
where title = '[11번가] Tableau 중급·고급 현업 맞춤 집중 교육';
