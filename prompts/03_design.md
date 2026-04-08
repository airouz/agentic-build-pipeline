# Design Phase Prompt

## Instructions

Use the writer agent to create a Design Spec based on the PRD.

### Reference Files
- PRD summary: `.ralph/phase_summaries/02_prd_summary.md`
- PRD full text: `.ralph/outputs/02_prd.md` (if needed)
- Research summary: `.ralph/phase_summaries/01_research_summary.md`

### Required Design Spec Sections

1. **Design Concept** — 1-sentence core visual concept + 2–3 reference apps
2. **Design Reference Analysis** — What to adopt / what to avoid per reference
3. **Typography** — Font selection + reasoning (based on target user demographics)
4. **Color System** — Primary/Secondary/Accent/Background + color psychology reasoning
5. **Component Inventory** — Atoms/Molecules/Organisms layer classification
6. **Page Specifications** — 4-state per page (Empty/Loading/Normal/Error)
7. **Information Hierarchy** — Visual priority per page
8. **Onboarding Storyboard** — Screen transition flow + UX copy
9. **Micro-interactions** — hover/focus/transition/feedback animations
10. **Design Tokens** — CSS variables defined in tokens.json
11. **Anti-AI Design Checklist** — All 10 items checked

### Anti-AI Design Checklist (must pass 10/10)
- [ ] No gradient backgrounds
- [ ] No excessive rounded cards + shadows
- [ ] No excessive whitespace
- [ ] No purple text
- [ ] No "AI-powered" wording
- [ ] No robot/sparkle emojis
- [ ] No illustration overuse
- [ ] No excessive animations
- [ ] No generic icon sets
- [ ] No placeholders — use real content

### Consistency Rules
- Page count must match PRD User Stories
- Components must cover all PRD features
- UX copy must follow PRD copywriting guide
- Personas must match Research

### Reference Apps (suggested)
- Finch (habit tracker)
- Everyday (timer)
- Streaks (routines)
- Things 3 (todo)
- Notion (notes)
- Spotify (music)

### Output
- Design Spec: `.ralph/outputs/03_design.md`
- Design Tokens: `.ralph/design/tokens.json`

### Tech Stack
- Next.js + TypeScript + shadcn/ui v4 (base-ui) + Tailwind CSS
- asChild prop is **not available** in shadcn v4
