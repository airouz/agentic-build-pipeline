# PRD Phase Prompt

## Instructions

Use the writer agent to create a PRD based on research results.

### Reference Files
- Research summary: `.ralph/phase_summaries/01_research_summary.md`
- Research full text: `.ralph/outputs/01_research.md` (if needed)

### Required PRD Sections

1. **Vision Statement** — Working Backwards. 1-page press release of the finished product
2. **User Stories** — P0/P1/P2 priority. BDD acceptance criteria per story (Given-When-Then)
3. **RICE Score** — Reach, Impact, Confidence, Effort quantitative scoring
4. **Onboarding Experience Design** — First 1min / 5min / 1day experience definitions
5. **Funnel Design** — Discovery → Signup → Activation → Retention UX per stage
6. **UX Copywriting** — Actual sentences for buttons, errors, empty states, tooltips, success messages
7. **Non-Functional Requirements** — Performance, accessibility, security
8. **Scope** — Clear MVP inclusions and exclusions

### Consistency Rules
- Personas must match Research exactly
- Pain points must be based on Research findings
- Feature counts and page counts must be explicitly stated (will be cross-verified in Design)

### Designer Perspective (Required)
- What emotions should users feel?
- What impression on first launch?
- How should users be comforted in error states?

### Output
- PRD: `.ralph/outputs/02_prd.md`
- PRD summary: `.ralph/phase_summaries/02_prd_summary.md`

### Review Criteria (for reference)
The reviewer agent will evaluate:
- Do all P0 stories have testable acceptance criteria?
- Is onboarding/funnel/UX copy concrete?
- Are RICE scores derived from research data?
- Do numbers (personas, feature counts) match Research?
