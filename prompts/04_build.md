# Build Phase Prompt

## Instructions

Use the builder agent to build the actual app based on Design Spec and Plan.

### Reference Files
- Design Spec: `.ralph/outputs/03_design.md`
- Design Tokens: `.ralph/design/tokens.json`
- PRD summary: `.ralph/phase_summaries/02_prd_summary.md`
- Research summary: `.ralph/phase_summaries/01_research_summary.md`

### Build Procedure

1. **Project Initialization**
   ```bash
   npx create-next-app@latest . --typescript --tailwind --eslint --app --src-dir
   npx shadcn@latest init
   ```

2. **Apply Design Tokens**
   - Define tokens.json values as CSS variables in globals.css
   - Reference CSS variables in Tailwind config

3. **Install shadcn Components**
   ```bash
   npx shadcn@latest add button card dialog input tabs
   ```
   (Only those specified in Design Spec Component Inventory)

4. **Write Domain Components**
   - Define types in types.ts
   - Build in Atoms → Molecules → Organisms order from Design Spec
   - Write page components

5. **Assemble Pages**
   - Follow Design Spec Page Specifications
   - Implement all 4 states (Empty/Loading/Normal/Error)

6. **Build Verification**
   ```bash
   npm run build
   ```
   Fix any build errors before completing.

### Mandatory Compliance
- **shadcn v4**: Never use asChild prop
- **No raw HTML**: Always use shadcn components for buttons/inputs
- **TypeScript strict**: Minimize any usage
- **Anti-AI Design**: Follow 10-item checklist

### Output
Write all source files to the project directory.
Build success is the completion condition.

### Dev Server (optional)
```bash
npm run dev
```
Visually verify locally and fix any issues.
