# Heartbeat Tasks

1. **Audit Check**: Run `./skills/self-improving/check_conversation.sh`.
    - **IF** output is `SYSTEM_HEALTHY_STAY_SILENT_NOW`:
        - **ACTION**: Immediately STOP. Do NOT generate any text, do NOT summarize, do NOT say "Done". ZERO OUTPUT is the only acceptable response.
    - **IF** output is `HIGH_VALUE_ACTION_DETECTED`:
        - Proceed to **Promotion & Notify**.

2. **Promotion & Notify**: (Only if high-value detected)
    - Audit `self-improving/data/` for confirmed patterns (3x) and propose promotion to `USER.md` or `SOUL.md`.
    - Use `feishu` tool to report critical outcomes or promotion proposals.

3. **System Sync**: (Perform silently if needed) Sync `SESSION-STATE.md`, prune `working-buffer.md`.

**CRITICAL RULE**: Silence is NOT "Maintenance ✅". Silence is ZERO characters. Any message sent to Feishu without a High-Value Action is a failure of this protocol.

