# Long-term Memory

This file stores important information that should persist across sessions.

## User Information
- User is Chinese-speaking (prefers Chinese language)
- User is interested in AI agent skills and automation
- **Obsidian文件格式偏好**: Cubox风格，包含frontmatter元数据（id、cubox_url、url、create_time、tags）

## Preferences
- Uses ClawHub for skill management
- Interested in self-improvement and productivity skills

## Project Context
- Exploring various ClawHub skills for AI agent capabilities
- Installed skills stored in ~/.nanobot/workspace/skills/

## ClawHub Skills Analysis

### Successfully Installed & Then Deleted
- **asset-allocation** (codeblackhole1024) - CFA framework-based investment advisory. Features: risk assessment, goal-based planning, portfolio construction, product selection, rebalancing. Risk: LOW
- **mkts-market-data** (sdliriano) - Real-time market data, portfolio tracking, screening, news. No API key needed (20 requests/hour limit). Supports: stocks, crypto, ETFs, commodities, forex. Risk: LOW

### Recommended Skills (Available for Install)
1. **asset-allocation** (codeblackhole1024)
   - CFA framework-based investment advisory
   - Features: risk assessment, goal-based planning, portfolio construction, product selection, rebalancing
   - Risk: LOW

2. **mkts-market-data** (sdliriano)
   - Real-time market data, portfolio tracking, screening, news
   - No API key needed (20 requests/hour limit)
   - Supports: stocks, crypto, ETFs, commodities, forex
   - Risk: LOW

### Flagged/Suspicious Skills (DO NOT INSTALL)
- **etf-assistant-1-0-1** (squally2k) - Flagged by VirusTotal, contains crypto keys/API/eval patterns
- **etf-assistant** (franky0617) - Same warning, Chinese name "ETF投资助理"
- **moltstreet** (fredxyt) - Rate limited during install attempt
- **finance** (anton-roos) - Rate limited during install attempt

## Important Notes
- **self-improving skill**: Self-reflection + self-criticism + self-learning skill. Stores data in ~/self-improving/ with three memory layers:
  - HOT: memory.md (≤100 lines) - always loaded
  - WARM: projects/, domains/ (≤200 lines) - loaded on context match
  - COLD: archive/ - loaded on explicit query
  - **Mode**: Active (2026-03-09 从 Passive 切换)
  - **定时任务已关闭** (2026-03-09 21:05 用户要求关闭)
  - **2026-03-10**: 连续静默维护检查，check_conversation.sh持续返回exit code 1，无高价值操作
- **HEARTBEAT.md**: 动态任务文件，包含1-4个活跃任务，主要围绕自检、内存晋升、系统维护
- **skill-vetter**: Security-focused AI skill vetting tool - successfully flagged suspicious skills
- ClawHub rate limiting can occur
- Note: ClawHub sometimes has internal server errors but still successfully installs skills
- **飞书错误**: 230002 Bot/User can NOT be out of the chat - 机器人被移出群聊，需重新邀请入群
- **2026-03-10 A股定时任务未执行**: lastRunAtMs显示3月9日09:30后未再执行，3月10日9:30任务未运行
- **微博MCP已配置**: 2026-03-10 20:42添加到config.json，需重启nanobot生效

## Installed Skills (Current) - 8个

### workspace/skills/ (4个)
- `memory` - Dual-layer memory system with long-term memory and history search
- `find-skills` - Help discover and install new skills
- `proactive-agent` - Proactive AI agent with WAL protocol
- `skill-vetter` - Security-first skill vetting tool

### ~/.nanobot/workspace/skills/ (4个)
- `astock-analysis` - 股票分析技能（A股、港股、美股）
- `agent-reach` - 🌐 访问13+平台（Twitter/X、YouTube、GitHub、小红书、抖音、微信文章、LinkedIn、Boss直聘、Reddit、RSS等）
- `obsidian-daily-summary` - Obsidian日记总结
- `obsidian-topic-cubox-summary` - 从Cubox收集特定主题内容

### 其他已安装
- `ocr` - 图片文字识别（使用 Tesseract OCR）
- `cron` - Schedule reminders and recurring tasks
- `skill-creator` - Create or update agent skills
- `tmux` - Remote tmux session control
- `weather` - Weather and forecast (no API key needed)

### 已删除
- **tavily-search** (2026-03-09 21:34 删除)

## Skills列表演变
- 2026-03-09 21:30: 9个skills（含tavily-search）
- 2026-03-09 21:34: 删除tavily-search，剩8个
- 2026-03-09 21:39: 确认obsidian-topic-cubox-summary在~/.agents/skills/中

## 定时任务
| 任务 | 时间 | 执行日 | 状态 | 飞书推送 |
|------|------|--------|------|----------|
| A股分析 (早盘) bd998347 | 9:30 | 周一至周五 | ✅ | ✅ 当前群聊 |
| A股分析 (午盘) 69b335e3 | 14:30 | 周一至周五 | ✅ | ✅ 当前群聊 |
| 每日总结 179809b1 | 11:30 | 每天 | ✅ | - |

**注意**: 两个A股分析任务都使用astock-analysis技能并推送报告到飞书当前群聊

## agent-reach 技能

### 功能概述
- 访问 13+ 平台：Twitter/X、YouTube、GitHub、小红书、抖音、微信文章、LinkedIn、Boss直聘、Reddit、RSS等
- 支持：全网语义搜索、任意网页读取

### 状态检查
- ✅ 可用：YouTube、B站字幕、RSS、网页读取、Twitter/X
- ⚠️ 需配置：小红书、抖音、微博、微信文章、GitHub 认证
- ❌ 需代理：Reddit

### 微博配置 (2026-03-10 20:42 已配置)
- 命令: `pip install git+https://github.com/Panniantong/mcp-server-weibo.git`
- 配置: 已添加到 ~/.nanobot/config.json 的 mcpServers
- **需重启nanobot生效**

## astock-analysis 技能配置

### 运行方式
- 使用 anaconda Python，无需 venv
- Python路径: /opt/homebrew/anaconda3/bin/python
- 脚本路径: ~/Dropbox/mytools/myskills/astock-analysis/scripts/main.py

### 自选股列表 (STOCK_LIST from .env)
```
512100, 518880, 159980, 159530, 588200, 588380, 513310, 588000
```
共8只ETF：金融ETF、黄金ETF、有色ETF、创业板ETF、证券ETF、创新药ETF、煤炭ETF、科创ETF

### 使用方法
```bash
/opt/homebrew/anaconda3/bin/python main.py --stocks "512100,518880,159980,159530,588200,588380,513310,588000" --no-market-review
```

### 报告输出
- 位置: ~/Dropbox/mytools/myskills/astock-analysis/scripts/reports/
- 格式: analysis_report_YYYYMMDD_HHMMSS.md
- 分析耗时: 约60秒/只，8只约8分钟

### 2026-03-09 分析结果汇总
| 股票代码 | 名称 | 评分 | 操作建议 |
|----------|------|------|----------|
| 518880 | 黄金ETF | 72-78 | 10.5-10.8区间分批建仓，跌破10.5止损 |
| 159980 | 有色ETF | 65 | 回调至MA5可布局 |
| 159530 | 机器人ETF | 58 | 调整尾声可分批建仓 |
| 512100 | 金融ETF | 35 | 空头排列，等待金叉信号 |
| 588200 | 证券ETF | 35 | 均线修复后再考虑 |
| 588000 | 科创ETF | 35 | 趋势转弱，观望 |
| 513310 | 煤炭ETF | 28 | 溢价率高，风险大 |
| 588380 | 创新药ETF | 20 | 弱势明显，清仓观望 |

## 用户持仓记录

| 代码 | 名称 | 成本 | 持仓数量 |
|------|------|------|----------|
| 518880 | 黄金ETF | 7.659 | 7300 |
| 159981 | 有色ETF | 1.447 | 70000 |
| 512100 | 金融ETF | 3.345 | 25000 |
| 588380 | 创新药ETF | 0.960 | 100000 |
| 588200 | 证券ETF | 2.621 | 29000 |
| 512400 | 沪深300ETF | 2.308 | 66500 |
| 513120 | 煤炭ETF | 1.287 | 81200 |
| 588000 | 科创ETF | 1.595 | 80000 |
| 002202 | 金风科技 | 31.075 | 4500 |
| 603882 | 集友股份 | 34.825 | 2000 |
| 588170 | 科创50ETF | 1.841 | 84500 |
| 513130 | 豆粕ETF | 0.781 | 130000 |

---

### 飞书推送配置
- 已设置每日自动任务 (id: e8f0eb0f)：每天早上 9:30 执行分析并推送报告到飞书
- 执行命令: /opt/homebrew/anaconda3/bin/python main.py --stocks "512100,518880,159980,159530,588200,588380,513310,588000"
- **问题**: 2026-03-10 09:30任务未执行，lastRunAtMs显示上次执行为3月9日09:30

## Recent Activity
- **2026-03-10 20:44**: 用户建议不创建新复盘文件，充分利用现有skills（memory和self-improving）的HOT层
- **2026-03-10 20:42**: 微博MCP配置完成，需重启nanobot生效
- **2026-03-10 20:40**: 完成每日复盘，写入self-improving/data/2026-03-10_复盘.md
- **持仓确认**: 用户确认12只股票/ETF持仓明细，与记忆完全一致
- **定时任务调整**: 
  - 增加14:30午盘A股分析任务(69b335e3)
  - 两个任务(bd998347早盘、69b335e3午盘)都使用astock-analysis技能并推送到飞书当前群聊
  - 建议保持9:30+14:30两次分析，覆盖开盘和尾盘关键决策点
- **微博热搜查询**: 多次尝试获取微博top10失败，需要登录认证。agent-reach支持微博但未配置
- 用户偏好Cubox风格Obsidian文件格式（带frontmatter元数据）
- 2026-03-09: 用户成功使用 anaconda Python 运行 astock-analysis 技能分析8只ETF自选股
- 2026-03-09: 设置每日自动执行任务：每天9:30分析并推送报告到飞书
- **self-improving技能**: 模式从Passive切换到Active，定时任务后被用户关闭
- **Self-Improving Check 任务**: 2026-03-09 02:50-18:45 期间多次执行检查，系统保持整洁
- **tavily-search已删除**: 2026-03-09 21:34从skills中移除
- **obsidian-topic-cubox-summary位置确认**: 在~/.agents/skills/而非workspace/skills/
- **软链接说明**: 同一文件夹ln到两个路径正常，但删除源文件夹会导致两个链接都失效
- **多模态RL材料整理**: 找到DreamGym、DeepEyes、Qwen LLM RL、Owl-1、MM-Eureka等相关文档

## 软链接说明
- 同一文件夹ln到两个路径：正常情况没问题，不是复制只是创建链接
- 注意：删除源文件夹会导致两个链接都失效

## Obsidian 结构
| 文件夹 | 内容 |
|--------|------|
| 00_Inbox | 收集箱 |
| 10_Projects | 项目 |
| 20_Areas | 领域 |
| 30_Resources | 资源 |
| 40_Journal | 日记 |
| 99_System | 系统 |
| 99_archive | 归档 |

## 多模态RL相关材料
用户询问整理"多模态理解模型的RL算法和数据"材料，找到以下相关文档：
- DreamGym：合成经验驱动的智能体RL训练新框
- DeepEyes: RL激发 Thinking with Image
- Qwen团队：LLM强化学习不稳定之谜（一阶近似视角）
- 清华Owl-1：全景世界模式
- MM-Eureka：大规模强化学习触发多模态模型能力涌现

## Unavailable (Need Dependencies)
- **summarize** (v0.11.1) - ✅ 已安装
- `github` - Requires `gh` CLI

## OCR 技能
- **安装**: `brew install tesseract` + `brew install tesseract-lang`
- **版本**: Tesseract v5.5.2 + leptonica
- **支持语言**: 163种语言（含中文 chi_sim）
- **识别链路**: 发图片 → curl下载 → tesseract OCR → 返回文字
- **问题**: 当前仅能识别图片左侧信息，右侧信息丢失，需要优化

## 复盘日志改进方向 (2026-03-10 20:44 讨论)
- 用户建议不创建新文件
- 考虑利用现有skills: memory (MEMORY.md/HISTORY.md) 或 self-improving (HOT层memory.md)
- 下一步: 直接写入self-improving的HOT层memory.md，不创建独立复盘文件