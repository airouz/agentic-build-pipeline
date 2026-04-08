#!/bin/bash
# Design Phase Mechanical Checklist
# Usage: bash checklists/design.sh

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

check "Deliverable file exists" "test -f $FILE"

# Required sections (allow various header names)
check "Design Concept or Overview" "grep -qi '## Design Concept\\|## Overview' $FILE"
check "Typography section" "grep -qi '## Typography' $FILE"
check "Color System section" "grep -qi '## Color\\|## Colour' $FILE"
check "Component Inventory section" "grep -qi '## Component' $FILE"
check "Page Specifications section" "grep -qi '## Page' $FILE"
check "Anti-AI checklist" "grep -qi 'anti.ai\\|Anti-AI\\|anti_ai' $FILE"

# Designer perspective
check "Design Reference analysis" "grep -qi 'reference' $FILE"
check "Onboarding Storyboard" "grep -qi 'onboarding\\|storyboard' $FILE"
check "Micro-interactions" "grep -qi 'micro.interaction\\|animation' $FILE"
check "Information Hierarchy" "grep -qi 'hierarchy\\|priority' $FILE"

# 4-state
check "Empty state defined" "grep -qi 'empty\\|empty state' $FILE"
check "Loading state defined" "grep -qi 'loading' $FILE"
check "Error state defined" "grep -qi 'error' $FILE"

# Tokens
check "tokens.json exists" "test -f $TOKENS"

# Color psychology
check "Color psychology reasoning" "grep -qi 'psychology\\|emotion\\|mood\\|feeling' $FILE"

echo ""
echo "=== Result: $PASS PASS / $FAIL FAIL ==="
if [ $FAIL -gt 0 ]; then
    echo -e "\nFailed items:$ERRORS"
fi
exit $FAIL
