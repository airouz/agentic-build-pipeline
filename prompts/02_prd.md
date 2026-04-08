# PRD Phase 프롬프트

## 지시사항

writer 에이전트를 사용하여 리서치 결과를 바탕으로 PRD를 작성하라.

### 참조 파일
- 리서치 요약: `.ralph/phase_summaries/01_research_summary.md`
- 리서치 원문: `.ralph/outputs/01_research.md` (필요시)

### PRD 필수 섹션

1. **Vision Statement** — Working Backwards. 완성된 제품의 프레스릴리즈 1페이지
2. **User Stories** — P0/P1/P2 우선순위. 각 스토리에 BDD 인수기준 (Given-When-Then)
3. **RICE Score** — Reach, Impact, Confidence, Effort 정량 평가
4. **온보딩 경험 설계** — 처음 1분 / 5분 / 1일 경험 정의
5. **퍼널 설계** — 발견→가입→활성→유지 각 단계 UX
6. **UX 카피라이팅** — 버튼/에러/빈상태/툴팁/성공 멘트 실제 문장
7. **Non-Functional Requirements** — 성능, 접근성, 보안
8. **Scope** — MVP 포함/제외 항목 명확히

### 일관성 규칙
- 페르소나는 Research와 동일하게
- 페인포인트는 Research에서 식별된 것을 기반으로
- 기능 수와 페이지 수를 명확히 명시 (Design에서 교차 검증됨)

### 디자이너 관점 필수
- 사용자가 어떤 감정을 느껴야 하는가
- 처음 켰을 때 어떤 인상을 받아야 하는가
- 에러 상황에서 어떻게 위로받아야 하는가

### 산출물 저장
- PRD: `.ralph/outputs/02_prd.md`
- PRD 요약: `.ralph/phase_summaries/02_prd_summary.md`

### 검토 기준 (미리 참고)
검토 에이전트가 다음을 평가함:
- 모든 P0에 테스트 가능한 인수기준이 있는가
- 온보딩/퍼널/UX 카피가 구체적인가
- RICE 점수가 리서치 데이터에서 도출되었는가
- 숫자(페르소나, 기능 수)가 Research와 일치하는가
