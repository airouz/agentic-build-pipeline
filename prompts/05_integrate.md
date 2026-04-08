# Integrate/QA Phase 프롬프트

## 지시사항

빌드된 앱의 품질을 종합 검증하라. 기계적 테스트 + 시각적 QA.

### 검증 항목

#### 1. 빌드 검증
```bash
npm run build
```
에러 없이 빌드 통과해야 함.

#### 2. 타입 검증
```bash
npx tsc --noEmit
```
타입 에러 없어야 함.

#### 3. 린트 검증
```bash
npm run lint
```
린트 에러 없어야 함.

#### 4. 기능 검증 (각 페이지)
Design Spec의 Page Specifications에 따라:
- [ ] 각 페이지가 정상 렌더링되는가
- [ ] Empty state가 표시되는가
- [ ] 로딩 상태가 있는가
- [ ] 에러 처리가 되어 있는가
- [ ] 인터랙션이 작동하는가

#### 5. 디자인 일치도
- [ ] Design Tokens가 적용되었는가
- [ ] Typography가 스펙과 일치하는가
- [ ] Color System이 스펙과 일치하는가
- [ ] Anti-AI Design Checklist 10/10 통과하는가

#### 6. 온보딩 플로우
- [ ] 첫 실행 시 온보딩이 표시되는가
- [ ] 프리셋 선택이 가능한가
- [ ] 온보딩 완료 후 메인으로 이동하는가

#### 7. 반응형 (모바일 우선)
- [ ] 375px 너비에서 정상 표시
- [ ] 768px 너비에서 정상 표시

### 검증 결과 보고
```markdown
# QA Report

## 빌드: PASS/FAIL
## 타입: PASS/FAIL
## 린트: PASS/FAIL
## 기능: {페이지별 결과}
## 디자인: PASS/FAIL
## 온보딩: PASS/FAIL
## 반응형: PASS/FAIL

## 발견된 이슈
1. {이슈 설명}
2. ...

## 수정 완료
- [ ] 이슈 1
- [ ] 이슈 2
```

### 산출물
`.ralph/outputs/05_integrate.md`에 QA 리포트 저장.
