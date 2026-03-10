#!/bin/bash
# Self-Improving 自检脚本

DATA_DIR="/Users/tlin/.nanobot/workspace/skills/self-improving/data"
LOG_FILE="$DATA_DIR/self_check.log"

echo "=== Self-Improving 自检 $(date '+%Y-%m-%d %H:%M') ===" >> "$LOG_FILE"

# 1. 检查 memory.md 行数
MEM_LINES=$(wc -l < "$DATA_DIR/memory.md")
echo "memory.md 行数: $MEM_LINES" >> "$LOG_FILE"

# 2. 检查 corrections.md 新条目
CORR_COUNT=$(grep -c "## 20" "$DATA_DIR/corrections.md" 2>/dev/null || echo 0)
echo "corrections 今日条目: $CORR_COUNT" >> "$LOG_FILE"

# 3. 检查 domains/projects 是否有内容
DOMAIN_COUNT=$(ls "$DATA_DIR/domains/" 2>/dev/null | wc -l)
PROJECT_COUNT=$(ls "$DATA_DIR/projects/" 2>/dev/null | wc -l)
echo "domains: $DOMAIN_COUNT, projects: $PROJECT_COUNT" >> "$LOG_FILE"

# 4. 每周六总结（周日/周一前）
if [ "$(date +%w)" -eq 6 ]; then
    echo "--- 周总结 ---" >> "$LOG_FILE"
    tail -20 "$LOG_FILE" >> "$LOG_FILE"
fi

echo "自检完成" >> "$LOG_FILE"
