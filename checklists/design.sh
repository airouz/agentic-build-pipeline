#!/bin/bash
# Design Phase 기계적 체크리스트
# 사용법: bash checklists/design.sh

FILE=".ralph/outputs/03_design.md"
TOKENS=".ralph/design/tokens.json"
PASS=0
FAIL=0
ERRORS=""

check() {
    local desc="$1"
    local cmd="$2"
    if eval "$cmd" > /dev/null 2>&1; then
        PASS=$((PASS + 1))
        echo "  PASS: $desc"
    else
        FAIL=$((FAIL + 1))
        ERRORS="$ERRORS\n  FAIL: $desc"
        echo "  FAIL: $desc"
    fi
}

echo "=== Design Phase Checklist ==="
echo ""

check "산출물 파일 존재" "test -f $FILE"

# 필수 섹션 (Overview/Design Concept 등 다양한 헤더 허용)
check "Design Concept 또는 Overview" "grep -qi '## Design Concept\\|## Overview\\|## 디자인 컨셉' $FILE"
check "Typography 섹션" "grep -qi '## Typography\\|## 타이포그래피' $FILE"
check "Color System 섹션" "grep -qi '## Color\\|## 컬러\\|## Colour' $FILE"
check "Component Inventory 섹션" "grep -qi '## Component\\|## 컴포넌트' $FILE"
check "Page Specifications 섹션" "grep -qi '## Page\\|## 페이지' $FILE"
check "Anti-AI 체크리스트" "grep -qi 'anti.ai\\|Anti-AI\\|anti_ai' $FILE"

# 디자이너 관점
check "Design Reference / 레퍼런스" "grep -qi 'reference\\|레퍼런스\\|참조' $FILE"
check "Onboarding Storyboard" "grep -qi 'onboarding\\|온보딩\\|storyboard\\|스토리보드' $FILE"
check "Micro-interactions" "grep -qi 'micro.interaction\\|인터랙션\\|animation\\|애니메이션' $FILE"
check "Information Hierarchy" "grep -qi 'hierarchy\\|계층\\|우선순위' $FILE"

# 4-state
check "Empty state 정의" "grep -qi 'empty\\|빈 상태\\|empty state' $FILE"
check "Loading state 정의" "grep -qi 'loading\\|로딩' $FILE"
check "Error state 정의" "grep -qi 'error\\|에러\\|오류' $FILE"

# 토큰
check "tokens.json 존재" "test -f $TOKENS"

# 컬러 심리학
check "컬러 심리학 근거" "grep -qi '심리\\|psychology\\|감성\\|분위기' $FILE"

echo ""
echo "=== 결과: $PASS PASS / $FAIL FAIL ==="
if [ $FAIL -gt 0 ]; then
    echo -e "\n실패 항목:$ERRORS"
fi
exit $FAIL
