#!/bin/bash
# PRD Phase 기계적 체크리스트
# 사용법: bash checklists/prd.sh

FILE=".ralph/outputs/02_prd.md"
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

echo "=== PRD Phase Checklist ==="
echo ""

check "산출물 파일 존재" "test -f $FILE"

# 필수 섹션
check "Vision Statement 섹션" "grep -qi '## Vision\\|## 비전' $FILE"
check "User Stories 섹션" "grep -qi '## User Stories\\|## 사용자 스토리' $FILE"
check "RICE 섹션" "grep -qi 'RICE\\|rice' $FILE"
check "NFR 섹션" "grep -qi '## Non-Functional\\|## NFR\\|## 비기능' $FILE"
check "Scope 섹션" "grep -qi '## Scope\\|## 범위' $FILE"

# 디자이너 관점
check "온보딩 경험 설계" "grep -qi '온보딩\\|onboarding' $FILE"
check "퍼널 설계" "grep -qi '퍼널\\|funnel' $FILE"
check "UX 카피라이팅" "grep -qi 'UX 카피\\|카피라이팅\\|copywriting\\|멘트' $FILE"

# BDD 인수기준
check "BDD 인수기준 (Given/When/Then)" "grep -qi 'given\\|when\\|then\\|Given\\|When\\|Then' $FILE"

# 정량 기준
check "P0 스토리 3개 이상" "[ \$(grep -ci 'P0\\|US-0' $FILE) -ge 3 ]"
check "우선순위 분류 (P0/P1/P2)" "grep -q 'P0\\|P1\\|P2' $FILE"
check "MVP Scope 정의" "grep -qi 'MVP\\|최소\\|포함\\|제외' $FILE"

# 일관성
check "페르소나 참조" "grep -qi 'persona\\|페르소나' $FILE"

echo ""
echo "=== 결과: $PASS PASS / $FAIL FAIL ==="
if [ $FAIL -gt 0 ]; then
    echo -e "\n실패 항목:$ERRORS"
fi
exit $FAIL
