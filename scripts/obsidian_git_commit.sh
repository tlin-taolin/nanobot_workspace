#!/bin/bash
# Auto Git Commit for ~/obsidian_sync
# 运行时间: 每天 6:30

cd ~/obsidian_sync || exit 1

# 检查是否有改动
if git diff --quiet && git diff --cached --quiet; then
    echo "$(date '+%Y-%m-%d %H:%M'): No changes to commit"
    exit 0
fi

# 添加所有改动
git add -A

# 提交，日期作为 message
DATE=$(date '+%Y-%m-%d %H:%M')
git commit -m "Auto commit: $DATE"

# 推送到远程
git push

echo "$(date '+%Y-%m-%d %H:%M'): Obsidian committed and pushed"
