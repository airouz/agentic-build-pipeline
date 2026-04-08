# Design Phase 프롬프트

## 지시사항

writer 에이전트를 사용하여 PRD를 바탕으로 Design Spec을 작성하라.

### 참조 파일
- PRD 요약: `.ralph/phase_summaries/02_prd_summary.md`
- PRD 원문: `.ralph/outputs/02_prd.md` (필요시)
- Research 요약: `.ralph/phase_summaries/01_research_summary.md`

### Design Spec 필수 섹션

1. **Design Concept** — 핵심 비주얼 컨셉 1문장 + 레퍼런스 앱 2~3개
2. **Design Reference Analysis** — 각 레퍼런스에서 차용할 점/차용하지 않을 점
3. **Typography** — 폰트 선택 + 선택 근거 (타깃 유저 기반)
4. **Color System** — Primary/Secondary/Accent/Background + 컬러 심리학 근거
5. **Component Inventory** — Atoms/Molecules/Organisms 계층 분류
6. **Page Specifications** — 각 페이지 4-state (Empty/Loading/Normal/Error)
7. **Information Hierarchy** — 각 페이지 시각적 우선순위
8. **Onboarding Storyboard** — 화면 전환 플로우 + UX 카피
9. **Micro-interactions** — hover/focus/전환/피드백 애니메이션
10. **Design Tokens** — tokens.json에 CSS 변수 정의
11. **Anti-AI Design Checklist** — 10항목 모두 체크

### Anti-AI Design Checklist (반드시 10/10)
- [ ] 그라데이션 배경 사용 안 함
- [ ] 둥근 카드+그림자 과용 안 함
- [ ] 과도한 여백 없음
- [ ] 보라색 텍스트 없음
- [ ] "AI-powered" 문구 없음
- [ ] 로봇/스파클 이모지 없음
- [ ] 일러스트레이션 과용 안 함
- [ ] 과도한 애니메이션 없음
- [ ] 제네릭 아이콘 세트 사용 안 함
- [ ] 실제 콘텐츠 사용 (placeholder 없음)

### 일관성 규칙
- 페이지 수는 PRD의 User Stories와 일치
- 컴포넌트는 PRD의 기능 목록을 모두 커버
- UX 카피는 PRD의 카피라이팅 가이드를 따름
- 페르소나는 Research와 동일

### 레퍼런스 앱 추천
디자인 분석 시 다음 앱 중 관련 있는 것을 참조:
- Finch (습관 트래커)
- Everyday (타이머)
- Streaks (루틴)
- Things 3 (할일)
- Notion (노트)
- Spotify (음악)

### 산출물 저장
- Design Spec: `.ralph/outputs/03_design.md`
- Design Tokens: `.ralph/design/tokens.json`

### Tech Stack
- Next.js + TypeScript + shadcn/ui v4 (base-ui) + Tailwind CSS
- shadcn v4에서 **asChild prop 사용 불가**
