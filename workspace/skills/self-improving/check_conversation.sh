#!/bin/bash
# 终极静默逻辑：通过输出内容精确控制模型行为

WORKSPACE="/Users/tlin/.nanobot/workspace"
SESSION_DIR="$WORKSPACE/sessions"
CORRECTIONS_FILE="$WORKSPACE/skills/self-improving/data/corrections.md"

CRITICAL_CHANGES=$(cd "$WORKSPACE" && git status --short | grep -E "^( M|\?\?) (USER.md|SOUL.md|HEARTBEAT.md|AGENTS.md)" 2>/dev/null)

PENDING_PROMOTIONS=""
if [[ -f "$CORRECTIONS_FILE" ]]; then
    PENDING_PROMOTIONS=$(grep -E "^- " "$CORRECTIONS_FILE" 2>/dev/null | grep -i "pending")
fi

NEW_USER_MSG=""
RECENT_SESSIONS=$(find "$SESSION_DIR" -maxdepth 1 -name "*.jsonl" ! -name "heartbeat.jsonl" ! -name "cron_*.jsonl" -mmin -35 2>/dev/null)
for session in $RECENT_SESSIONS; do
    if tail -n 2 "$session" | grep -q '"role": "user"'; then
        NEW_USER_MSG="FOUND"
        break
    fi
done

if [[ -n "$CRITICAL_CHANGES" ]] || [[ -n "$PENDING_PROMOTIONS" ]] || [[ -n "$NEW_USER_MSG" ]]; then
    echo "HIGH_VALUE_ACTION_DETECTED"
    exit 0
else
    # 没事时输出这个特殊标记，并返回 0 (让模型觉得任务已成功完成，无需报错或确认)
    echo "SYSTEM_HEALTHY_STAY_SILENT_NOW"
    exit 0
fi
