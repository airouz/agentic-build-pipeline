# Build Phase 프롬프트

## 지시사항

builder 에이전트를 사용하여 Design Spec과 Plan을 기반으로 실제 앱을 빌드하라.

### 참조 파일
- Design Spec: `.ralph/outputs/03_design.md`
- Design Tokens: `.ralph/design/tokens.json`
- PRD 요약: `.ralph/phase_summaries/02_prd_summary.md`
- Research 요약: `.ralph/phase_summaries/01_research_summary.md`

### 빌드 절차

1. **프로젝트 초기화**
   ```bash
   npx create-next-app@latest . --typescript --tailwind --eslint --app --src-dir
   npx shadcn@latest init
   ```

2. **Design Tokens 적용**
   - tokens.json의 값을 globals.css에 CSS 변수로 정의
   - Tailwind 설정에서 CSS 변수 참조

3. **shadcn 컴포넌트 설치**
   ```bash
   npx shadcn@latest add button card dialog input tabs
   ```
   (Design Spec의 Component Inventory에 명시된 것만)

4. **도메인 컴포넌트 작성**
   - types.ts에 타입 정의
   - Design Spec의 Atoms → Molecules → Organisms 순서로 작성
   - 각 페이지 컴포넌트 작성

5. **페이지 조립**
   - Design Spec의 Page Specifications에 따라 조립
   - 4-state (Empty/Loading/Normal/Error) 모두 구현

6. **빌드 검증**
   ```bash
   npm run build
   ```
   빌드 에러가 있으면 수정 후 재빌드.

### 필수 준수
- **shadcn v4**: asChild prop 절대 사용 금지
- **raw HTML 금지**: 버튼/인풋은 반드시 shadcn 컴포넌트 사용
- **TypeScript strict**: any 사용 최소화
- **Anti-AI Design**: 10항목 체크리스트 준수

### 산출물
프로젝트 디렉토리에 모든 소스 파일 작성.
빌드 성공이 완료 조건.

### dev 서버 실행 (선택)
```bash
npm run dev
```
로컬에서 시각 확인 후 문제 있으면 수정.
