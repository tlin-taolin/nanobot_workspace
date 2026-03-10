# HOT Memory — 常用模式

> 保持 ≤100 行，最常用的模式放在这里

## Preferences / 用户偏好
- 偏好使用 Anaconda Python 环境进行脚本开发与执行。
- 偏好 Senior Engineer tone，回复简洁直接。
- 偏好使用 ClawHub 管理技能，并执行严格的安全审计 (`skill-vetter`)。

## Patterns / 学习模式
- `astock-analysis` 每日 09:30 + 14:30 推送报告至飞书。
- `self-improving` 处于 **Active** 模式，需全天多次自检。
- Mac Studio 不适合本地大模型部署（速度慢），建议采用 API 或 GPU 租赁方案。

## Project defaults / 项目默认
- Python 默认路径: `/opt/homebrew/anaconda3/bin/python`
- 技能存储位置: `~/.nanobot/workspace/skills/`

## Rules / 规则
- 遵循 `SKILLS_COOPERATION.md` 的分层记忆架构。
- 修改核心配置（`SOUL.md`, `USER.md`）需 Git 提交保护。
- 在报告"任务失败"前，至少尝试 10 种不同路径。
- 所有的修改遵循 WAL (Write-Ahead Log) 协议。
