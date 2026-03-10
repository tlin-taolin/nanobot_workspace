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
- **HEARTBEAT功能未配置** (2026-03-10 21:28): HEARTBEAT.md定义了规范但未加入cron，用户询问后确认无自动heartbeat任务

## GitHub 同步 (2026-03-10 20:59)
- Remote: https://github.com/tlin-taolin/nanobot_workspace
- **workspace目录已成功转换** (2026-03-10 20:59): 从submodule转为普通目录
- **3个commits推送成功**:
  - e9b30ff - 初始提交
  - 9e285ee - Add workspace folder (59 files, 4721 lines)
  - 50f4b6f - Update .gitignore
- .gitignore已更新排除: config.json, .clawhub, sessions, logs

## 已删除 Skills
- **tavily-search** (2026-03-09 21:34 删除)

## Skills列表演变
- 2026-03-09 21:30: 9个skills（含tavily-search）
- 2026-03-09 21:34: 删除tavily-search，剩8个
- 2026-03-09 21:39: 确认obsidian-topic-cubox-summary在~/.agents/skills/中
- 2026-03-10 20:59: workspace成功转换并推送到GitHub

## 定时任务
| 任务 | 时间 | 执行日 | 状态 | 飞书推送 |
|------|------|--------|------|----------|
| A股分析 (早盘) bd998347 | 9:30 | 周一至周五 | ✅ | ✅ 当前群聊 |
| A股分析 (午盘) 69b335e3 | 14:30 | 周一至周五 | ✅ | ✅ 当前群聊 |
| 每日总结 179809b1 | 11:30 | 每天 | ✅ | - |
| Git Auto Commit 2be0783e | 6:00 | 每天 | ✅ | - |

**注意**: 两个A股分析任务都使用astock-analysis技能并推送报告到飞书当前群聊

**2026-03-10 23:27 更新**: 定时任务分析标的已更新为用户实际持仓11只股票

## agent-reach 技能

### 功能概述
- 访问 13+ 平台：Twitter/X、YouTube、GitHub、小红书、抖音、微信文章、LinkedIn、Boss直聘、Reddit、RSS等
- 支持：全网语义搜索、任意网页读取

### 状态检查
- ✅ 可用：YouTube、B站字幕、RSS、网页读取、Twitter/X、全网搜索(Exa)
- ⚠️ 需配置：小红书、抖音、微博、微信文章、GitHub 认证
- ❌ 需代理：Reddit

### Exa 搜索配置 (2026-03-10 23:35 已配置)
- 命令: `mcporter config add exa https://mcp.exa.ai/mcp`
- 使用: `mcporter call 'exa.web_search_exa(query: "...", numResults: 5)'`
- 场景: web_search不可用时的首选替代方案

### 微博配置 (2026-03-10 20:42 已配置)
- 命令: `pip install git+https://github.com/Panniantong/mcp-server-weibo.git`
- 配置: 已添加到 ~/.nanobot/config.json 的 mcpServers
- **需重启nanobot生效**

## astock-analysis 技能配置

### 运行方式
- 使用 anaconda Python，无需 venv
- Python路径: /opt/homebrew/anaconda3/bin/python
- 脚本路径: ~/Dropbox/mytools/myskills/astock-analysis/scripts/main.py

### 自选股列表 (2026-03-10 23:27 已更新为用户实际持仓)
```
518880,512100,588380,588200,512400,513120,588000,002202,588170,513130
```
共11只：黄金ETF华安、中证1000ETF、双创50ETF、科创芯片ETF、有色金属ETF、港股创新药ETF、科创50ETF、金风科技、科创半导体ETF、恒生科技ETF、能源化工ETF建信(159981)

### 使用方法
```bash
/opt/homebrew/anaconda3/bin/python main.py --stocks "518880,512100,588380,588200,512400,513120,588000,002202,588170,513130" --no-market-review
```

### 报告输出
- 位置: ~/Dropbox/mytools/myskills/astock-analysis/scripts/reports/
- 格式: analysis_report_YYYYMMDD_HHMMSS.md

### 2026-03-10 23:24 分析结果汇总
| 股票代码 | 名称 | 评分 | 操作建议 |
|----------|------|------|----------|
| 518880 | 黄金ETF华安 | 72 | 🟢 择机买入 |
| 588380 | 双创50ETF | 72 | 🟢 择机买入 |
| 002202 | 金风科技 | 72 | 🟢 择机买入 |
| 588170 | 科创半导体ETF | 72 | 🟢 择机买入 |
| 512400 | 有色金属ETF | 65 | 🟢 择机买入 |
| 588200 | 科创芯片ETF | 62 | 🟡 持有/观望 |
| 513120 | 港股创新药ETF | 62 | 🟡 持有/观望 |
| 588000 | 科创50ETF | 58 | 🟡 持有/观望 |
| 512100 | 中证1000ETF | 55 | 🟡 持有/观望 |
| 513130 | 恒生科技ETF | 35 | 🔴 清仓/回避 |

## 用户持仓记录 (2026-03-10 23:16 核对后)

| 代码 | 名称 | 成本 | 持仓数量 |
|------|------|------|----------|
| 518880 | 黄金ETF华安 | 7.659 | 7300 |
| 159981 | 能源化工ETF建信 | 1.447 | 70000 |
| 512100 | 中证1000ETF | 3.345 | 25000 |
| 588380 | 双创50ETF | 0.954 | 持有中 |
| 588200 | 科创芯片ETF | 2.621 | 29000 |
| 512400 | 有色金属ETF | 2.308 | 66500 |
| 513120 | 港股创新药ETF | 1.287 | 81200 |
| 588000 | 科创50ETF | 1.595 | 80000 |
| 002202 | 金风科技 | 31.075 | 4500 |
| 588170 | 科创半导体ETF | 1.841 | 84500 |
| 513130 | 恒生科技ETF | 0.781 | 130000 |

---

### 飞书推送配置
- 已设置每日自动任务 (id: e8f0eb0f)：每天早上 9:30 执行分析并推送报告到飞书
- 执行命令: /opt/homebrew/anaconda3/bin/python main.py --stocks "518880,512100,588380,588200,512400,513120,588000,002202,588170,513130"
- **问题**: 2026-03-10 09:30任务未执行，lastRunAtMs显示上次执行为3月9日09:30

## Recent Activity
- **2026-03-10 23:27**: 定时任务更新为分析用户实际11只持仓
- **2026-03-10 23:24**: astock-analysis完成10只持仓深度分析（黄金ETF/双创50/金风科技/科创半导体评分最高72分，恒生科技35分建议清仓）
- **2026-03-10 23:16**: 用户确认159981是能源化工ETF建信(非603882)，更新持仓记忆
- **2026-03-10 23:14**: 用户指出持仓代码和名称不符，要求核对
- **2026-03-10 23:35**: Exa搜索已配置（`mcporter config add exa https://mcp.exa.ai/mcp`），web_search不可用时使用 agent-reach 替代
- **2026-03-10 21:28**: heartbeat功能检查确认未配置定时任务，HEARTBEAT.md定义了规范但未加入cron
- **2026-03-10 20:59**: ✅ workspace目录成功转换为普通目录并推送到GitHub（3 commits）
- **2026-03-10 20:56**: GitHub远程仓库首次push成功
- **2026-03-10 20:54**: 初始化~/.nanobot为git仓库，添加remote: https://github.com/tlin-taolin/nanobot_workspace
- **2026-03-10 20:53**: 添加每日6:00自动git commit任务(2be0783e)
- **2026-03-10 20:52**: 用户取消每日复盘定时任务，清理相关修改
- **2026-03-10 20:48**: 讨论memory.md位置，用户指出应放warm层而非HOT层
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
- **已取消**: 用户后来取消此定时任务