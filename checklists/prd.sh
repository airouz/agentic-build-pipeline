#!/bin/bash
# PRD Phase Mechanical Checklist
# Usage: bash checklists/prd.sh

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

check "Deliverable file exists" "test -f $FILE"

# Required sections
check "Vision Statement section" "grep -qi '## Vision' $FILE"
check "User Stories section" "grep -qi '## User Stories' $FILE"
check "RICE section" "grep -qi 'RICE\\|rice' $FILE"
check "NFR section" "grep -qi '## Non-Functional\\|## NFR' $FILE"
check "Scope section" "grep -qi '## Scope' $FILE"

# Designer perspective
check "Onboarding experience design" "grep -qi 'onboarding' $FILE"
check "Funnel design" "grep -qi 'funnel' $FILE"
check "UX copywriting guide" "grep -qi 'copywriting\\|UX copy\\|copy guide' $FILE"

# BDD acceptance criteria
check "BDD acceptance criteria (Given/When/Then)" "grep -qi 'given\\|when\\|then' $FILE"

# Quantitative thresholds
check "3+ P0 stories" "[ \$(grep -ci 'P0\\|US-0' $FILE) -ge 3 ]"
check "Priority classification (P0/P1/P2)" "grep -q 'P0\\|P1\\|P2' $FILE"
check "MVP scope defined" "grep -qi 'MVP\\|minimum\\|include\\|exclude' $FILE"

# Consistency
check "Persona references" "grep -qi 'persona' $FILE"

echo ""
echo "=== Result: $PASS PASS / $FAIL FAIL ==="
if [ $FAIL -gt 0 ]; then
    echo -e "\nFailed items:$ERRORS"
fi
exit $FAIL
