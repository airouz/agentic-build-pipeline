#!/bin/bash
# Research Phase Mechanical Checklist
# Usage: bash checklists/research.sh

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

# File exists
check "Deliverable file exists" "test -f $FILE"

# Required sections
check "Executive Summary section" "grep -qi '## Executive Summary' $FILE"
check "Market Context section" "grep -qi '## Market Context' $FILE"
check "Competitive Landscape section" "grep -qi '## Competitive' $FILE"
check "User Pain Points section" "grep -qi '## User Pain Points' $FILE"
check "User Personas section" "grep -qi '## User Personas' $FILE"
check "Lean Canvas or JTBD section" "grep -qi '## \\(Lean Canvas\\|JTBD\\|Jobs To Be Done\\)' $FILE"
check "Opportunities section" "grep -qi '## Opportunities' $FILE"

# Designer perspective
check "Emotional Journey section" "grep -qi '## Emotional Journey' $FILE"
check "User Context section" "grep -qi '## User Context' $FILE"

# Quantitative thresholds
check "5+ competitors (table rows)" "[ \$(grep -c '|' $FILE) -ge 10 ]"
check "10+ pain point mentions" "[ \$(grep -ci 'pain\\|frustrat\\|problem\\|difficulty\\|complaint' $FILE) -ge 5 ]"
check "2+ persona mentions" "[ \$(grep -ci 'persona' $FILE) -ge 2 ]"

# Sources
check "Sources/references included" "grep -qi 'source\\|reference\\|http' $FILE"

echo ""
echo "=== Result: $PASS PASS / $FAIL FAIL ==="
if [ $FAIL -gt 0 ]; then
    echo -e "\nFailed items:$ERRORS"
fi
exit $FAIL
