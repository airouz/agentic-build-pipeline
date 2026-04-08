#!/bin/bash
# Research Phase 기계적 체크리스트
# 사용법: bash checklists/research.sh

FILE=".ralph/outputs/01_research.md"
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

echo "=== Research Phase Checklist ==="
echo ""

# 파일 존재
check "산출물 파일 존재" "test -f $FILE"

# 필수 섹션
check "Executive Summary 섹션" "grep -qi '## Executive Summary' $FILE"
check "Market Context 섹션" "grep -qi '## Market Context' $FILE"
check "Competitive Landscape 섹션" "grep -qi '## Competitive' $FILE"
check "User Pain Points 섹션" "grep -qi '## User Pain Points' $FILE"
check "User Personas 섹션" "grep -qi '## User Personas' $FILE"
check "Lean Canvas 또는 JTBD 섹션" "grep -qi '## \\(Lean Canvas\\|JTBD\\|Jobs To Be Done\\)' $FILE"
check "Opportunities 섹션" "grep -qi '## Opportunities' $FILE"

# 디자이너 관점
check "감정 여정 (Emotional Journey)" "grep -qi '## Emotional Journey' $FILE"
check "사용자 컨텍스트 (User Context)" "grep -qi '## User Context' $FILE"

# 정량 기준
check "경쟁사 5개 이상" "[ \$(grep -c '|' $FILE) -ge 10 ]"
check "페인포인트 10개 이상" "[ \$(grep -ci 'pain\\|불만\\|문제\\|어려움\\|불편' $FILE) -ge 5 ]"
check "페르소나 2개 이상" "[ \$(grep -ci 'persona\\|페르소나' $FILE) -ge 2 ]"

# 출처
check "출처/참조 포함" "grep -qi '출처\\|참조\\|source\\|reference\\|http' $FILE"

echo ""
echo "=== 결과: $PASS PASS / $FAIL FAIL ==="
if [ $FAIL -gt 0 ]; then
    echo -e "\n실패 항목:$ERRORS"
fi
exit $FAIL
