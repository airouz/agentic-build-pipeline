#!/bin/bash
# Run all pipeline checklists
# Usage: bash checklists/run-all.sh

echo "=========================================="
echo "  Build Pipeline — All Checklists"
echo "=========================================="
echo ""

TOTAL_PASS=0
TOTAL_FAIL=0

# Research
echo "--- Research Phase ---"
bash checklists/research.sh 2>/dev/null
if [ $? -eq 0 ]; then
    echo "  >> Research: PASS"
    TOTAL_PASS=$((TOTAL_PASS + 1))
else
    echo "  >> Research: FAIL"
    TOTAL_FAIL=$((TOTAL_FAIL + 1))
fi
echo ""

# PRD
echo "--- PRD Phase ---"
bash checklists/prd.sh 2>/dev/null
if [ $? -eq 0 ]; then
    echo "  >> PRD: PASS"
    TOTAL_PASS=$((TOTAL_PASS + 1))
else
    echo "  >> PRD: FAIL"
    TOTAL_FAIL=$((TOTAL_FAIL + 1))
fi
echo ""

# Design
echo "--- Design Phase ---"
bash checklists/design.sh 2>/dev/null
if [ $? -eq 0 ]; then
    echo "  >> Design: PASS"
    TOTAL_PASS=$((TOTAL_PASS + 1))
else
    echo "  >> Design: FAIL"
    TOTAL_FAIL=$((TOTAL_FAIL + 1))
fi
echo ""

echo "=========================================="
echo "  Total: $TOTAL_PASS PASS / $TOTAL_FAIL FAIL"
echo "=========================================="

exit $TOTAL_FAIL
