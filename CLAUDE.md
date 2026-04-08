# Build Pipeline — Claude Code Edition

## Overview

AI-powered build pipeline for Claude Code. Runs through Research → PRD → Design → Build → Integrate phases.
Each phase goes through: writer agent → mechanical checklist → reviewer agent evaluation.

## Pipeline Rules

### Entry
When the user says "run pipeline" or "start build pipeline", create `.ralph/` directory, initialize `state.json`, and start the phase sequence.

### Phase Sequence
```
init → research → prd → design → build → integrate → report
```

### Phase Execution Steps

```
1. Set phase status to "in_progress" in state.json
2. Spawn writer agent (researcher or writer)
   - Only reference previous phase summaries (.ralph/phase_summaries/)
   - Save deliverable to .ralph/outputs/NN_{phase}.md
3. Run mechanical checklist (checklists/{phase}.sh)
   - Record failed items
4. Spawn reviewer agent
   - Pass deliverable + checklist results + previous phase summary
   - Verdict: PASS / REVISE / REWRITE
5. Handle verdict:
   - PASS → write summary, proceed to next phase
   - REVISE → pass feedback to writer, retry (max 2 times)
   - REWRITE → full rewrite (max 1 time)
   - 3+ attempts → escalate to user
6. On PASS, write .ralph/phase_summaries/NN_{phase}_summary.md
```

### Agent Assignment

| Role | Agent | Model |
|------|-------|-------|
| Research writer | researcher | sonnet |
| PRD/Design/Plan writer | writer | sonnet |
| Review | reviewer | **haiku** |
| Build | builder | sonnet |
| Integrate/QA | main session | sonnet |

### Tech Stack (defaults)
- Next.js + TypeScript + shadcn/ui + Tailwind CSS
- shadcn/ui v4 (base-ui): **asChild not supported**
- Static export preferred

### Deliverable Structure
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

## Important Rules
- Coordinator (main session) must never write or review deliverables directly
- Writing and reviewing must always be done by different agents
- All deliverables must be saved as files (not just displayed in chat)
- state.json must be updated at every step
- asChild prop is forbidden in shadcn v4
