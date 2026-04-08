# Integrate/QA Phase Prompt

## Instructions

Comprehensively verify the quality of the built app. Mechanical tests + visual QA.

### Verification Items

#### 1. Build Verification
```bash
npm run build
```
Must pass without errors.

#### 2. Type Verification
```bash
npx tsc --noEmit
```
Must have no type errors.

#### 3. Lint Verification
```bash
npm run lint
```
Must have no lint errors.

#### 4. Functional Verification (per page)
Based on Design Spec Page Specifications:
- [ ] Does each page render correctly?
- [ ] Is empty state displayed?
- [ ] Is there a loading state?
- [ ] Is error handling implemented?
- [ ] Do interactions work?

#### 5. Design Fidelity
- [ ] Are Design Tokens applied?
- [ ] Does Typography match the spec?
- [ ] Does Color System match the spec?
- [ ] Does Anti-AI Design Checklist pass 10/10?

#### 6. Onboarding Flow
- [ ] Is onboarding shown on first launch?
- [ ] Can presets be selected?
- [ ] Does it navigate to main after onboarding completes?

#### 7. Responsive (Mobile-first)
- [ ] Renders correctly at 375px width
- [ ] Renders correctly at 768px width

### Verification Report
```markdown
# QA Report

## Build: PASS/FAIL
## Types: PASS/FAIL
## Lint: PASS/FAIL
## Functional: {per-page results}
## Design: PASS/FAIL
## Onboarding: PASS/FAIL
## Responsive: PASS/FAIL

## Issues Found
1. {issue description}
2. ...

## Fixes Completed
- [ ] Issue 1
- [ ] Issue 2
```

### Output
Save QA report to `.ralph/outputs/05_integrate.md`.
