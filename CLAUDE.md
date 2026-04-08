# Build Pipeline — Claude Code Edition

## 개요

이 프로젝트는 AI 기반 빌드 파이프라인을 Claude Code에서 실행합니다.
Research → PRD → Design → Build → Integrate 5단계로 진행하며,
각 phase마다 작성 → 기계적 체크리스트 → 검토 에이전트 평가를 거칩니다.

## 파이프라인 실행 규칙

### 진입
사용자가 "파이프라인 실행" 또는 "빌드 파이프라인 시작"이라고 하면,
`.ralph/` 디렉토리를 생성하고 `state.json`을 초기화한 후 phase 시퀀스를 시작합니다.

### Phase 시퀀스
```
init → research → prd → design → build → integrate → report
```

### 각 Phase 실행 절차

```
1. phase 스테이터스를 state.json에 "in_progress"로 저장
2. 작성 에이전트 스폰 (researcher 또는 writer)
   - 이전 phase 요약(.ralph/phase_summaries/)만 참조
   - 산출물을 .ralph/outputs/NN_{phase}.md 에 저장
3. 기계적 체크리스트 실행 (checklists/{phase}.sh)
   - 실패 항목 기록
4. 검토 에이전트 스폰 (reviewer)
   - 산출물 + 체크리스트 결과 + 이전 phase 요약 전달
   - 판정: PASS / REVISE / REWRITE
5. 판정 처리:
   - PASS → 요약 작성 후 다음 phase
   - REVISE → 피드백과 함께 작성 에이전트 재실행 (최대 2회)
   - REWRITE → 전체 재작성 (최대 1회)
   - 3회 초과 → 사용자에게 에스컬레이션
6. PASS 시 .ralph/phase_summaries/NN_{phase}_summary.md 작성
```

### 에이전트 배정

| 역할 | 에이전트 | 모델 |
|------|---------|------|
| Research 작성 | researcher | sonnet |
| PRD/Design/Plan 작성 | writer | sonnet |
| 검토 | reviewer | **haiku** |
| Build | builder | sonnet |
| Integrate/QA | 메인이 직접 | sonnet |

### Tech Stack (기본값)
- Next.js + TypeScript + shadcn/ui + Tailwind CSS
- shadcn/ui v4 (base-ui): **asChild 사용 불가**
- 정적 배포 우선

### 산출물 구조
```
.ralph/
├── state.json
├── outputs/
│   ├── 01_research.md
│   ├── 02_prd.md
│   ├── 03_design.md
│   ├── 04_build.md
│   └── 05_integrate.md
└── phase_summaries/
    ├── 01_research_summary.md
    ├── 02_prd_summary.md
    └── ...
```

### Jam Mode (Fast MVP)
init → build → verify 로 축약.
Design은 간단한 개념만 프롬프트에 포함.
검토봇 생략, 기계적 체크리스트만.

## 중요 규칙
- 코디네이터(메인)는 직접 산출물을 작성하거나 검토하지 않음
- 작성과 검토는 반드시 다른 에이전트가 수행
- 모든 산출물은 파일로 저장 (대화창에만 출력하지 않음)
- state.json은 매 단계마다 업데이트
- shadcn v4에서 asChild prop 사용 금지
