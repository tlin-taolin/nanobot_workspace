# Long-term Memory

This file stores important information that should persist across sessions.

## User Information
- User is Chinese-speaking (prefers Chinese language)
- User is interested in AI agent skills and automation
- **Obsidian文件格式偏好**: Cubox风格，包含frontmatter元数据（id、cubox_url、url、create_time、tags）

## Preferences
- Uses ClawHub for skill management
- Interested in self-improvement and productivity skills
- **搜索优先使用 agent-reach 技能**

## Python环境配置 (重要！)
- **大部分 skill 应使用 anaconda Python**: `/opt/homebrew/anaconda3/bin/python3`
- **nanobot CLI 路径**: `/Users/tlin/Dropbox/mytools/nanobot/.venv/bin/nanobot`
- 避免直接调用 `python3`，应优先使用 anaconda 环境

## Project Context
- Exploring various ClawHub skills for AI agent capabilities
- Installed skills stored in ~/.nanobot/workspace/skills/

## nanobot进程状态 (2026-03-12 17:43)
- **运行中**: PID 33726 (通过 .venv 启动)
- **之前问题**: 曾有2个进程(PID 23900 anaconda, PID 33726 .venv)，已手动kill旧进程

## Runtime Context Bug修复 (2026-03-12 17:30)
- **问题**: LLM错误地将system prompt中的`[Runtime Context — metadata only]`标签作为回答输出
- **修复**: loop.py中检测到响应以`[Runtime Context`开头时，直接跳过前4行(固定格式)，从第5行开始提取实际内容
- **验证**: 用户看到的是飞书引用旧消息导致，非nanobot新回复

## 持仓数据 (2026-03-12)
- **位置**: `~/.nanobot/workspace/skills/astock-analysis/scripts/data/portfolio.json`
- **格式**: JSON，以股票代码为key，包含stock_code、stock_name、quantity、cost_price、entry_date、last_update

## ClawHub Skills Analysis

### 必装技能 (OpenClaw + Obsidian 配合)
| 技能 | 用途 | 安装命令 |
|------|------|----------|
| **obsidian** | 让 OpenClaw 写入 Obsidian | `npx clawhub@latest install obsidian` |
| **x-reader** | 联网搜索和链接解析（小红书、B站、X） | 手动安装 |
| **agent-reach** | 联网搜索 + 13+平台内容抓取 | 手动安装 |
| **find-skills** | 主动找 Skill 解决问题 | `npx clawhub@latest install find-skills` |
| **proactive-agent** | 自我迭代的主动 Agent | `npx clawhub install proactive-agent-1-2-4` |

### x-reader 技能详解 (2026-03-12 新增)
- **GitHub**: https://github.com/runesleo/x-reader
- **定位**: 通用内容读取器，从7+平台抓取内容并结构化输出
- **支持平台**:
  | 平台 | 文本获取 | 视频/音频转录 |
  |------|---------|--------------|
  | YouTube | ✅ Jina | ✅ yt-dlp + Whisper |
  | Bilibili | ✅ API | ✅ Claude Code skill |
  | X/Twitter | ✅ Jina → Playwright | — |
  | 微信公众号 | ✅ Jina → Playwright | — |
  | 小红书 | ✅ Jina → Playwright | — |
  | Telegram | ✅ API | — |
  | RSS | ✅ feedparser | — |
  | 小宇宙/Apple Podcasts | — | ✅ Claude Code skill |
- **安装**:
  ```bash
  pip install "x-reader[all] @ git+https://github.com/runesleo/x-reader.git"
  playwright install chromium
  brew install yt-dlp ffmpeg  # macOS
  ```
- **核心功能**: 自动平台检测、统一Markdown输出、视频转录+AI总结、Obsidian集成

### x-reader vs agent-reach 核心区别 (2026-03-12 新增)
| 维度 | x-reader | agent-reach |
|------|----------|-------------|
| **定位** | 内容读取器（Read） | 平台工具箱（搜索+读取+交互） |
| **核心能力** | 抓取URL内容并结构化 | 13+平台的搜索/读取/发布 |
| **视频处理** | ✅ 强（Whisper转录+AI总结） | ❌ 弱 |
| **微信/小红书** | ✅ 强（Playwright绕过反爬） | ✅ 有miku_ai+mcporter |
| **写作能力** | ❌ 无 | ✅ 可发推文/评论/发小红书 |
| **安装复杂度** | 较复杂（依赖多） | 较简单 |

**使用建议**:
- 只做内容抓取/总结 → x-reader
- 需要搜索+抓取+发布 → agent-reach
- 视频需要完整字幕 → x-reader
- 公众号/小红书搜索 → agent-reach

### Successfully Installed & Then Deleted
- **asset-allocation** (codeblackhole1024) - CFA framework-based investment advisory. Features: risk assessment
- **tavily-search** - 已删除（剩余8个skills）

### 技能安装位置
- obsidian-topic-cubox-summary 实际安装在 ~/.agents/skills/

## 核心配置文件（4个文件）
1. **SOUL_OBSIDIAN.md** — 安全规则（禁止 rm/mv 命令、强制元数据注入）
2. **USER_OBSIDIAN.md** — 写作风格（语言、标题公式、结构要求）
3. **SOP_GZH.md** — 内容生产流程（灵感捕获→选题→大纲→初稿→归档）
4. **AGENTS.md** — 启动必读文件

## 定时任务 (2026-03-12 更新)

| 时间 | 任务 | 备注 |
|------|------|------|
| 6:00 | Git自动提交（nanobot·6:00） | 脚本: ~/.nanobot/scripts/nanobot_git_commit.sh |
| 6:30 | Git自动提交（obsidian·6:30） | 仓库: ~/obsidian_sync |
| 9:30 | A股早盘分析（9:30·16只） | |
| 14:30 | A股午盘分析（14:30·16只） | |
| 11:30 | Obsidian每日总结（11:30） | 脚本: /Users/tlin/Dropbox/mytools/myskills/scripts/run_daily_summary.sh |

### 定时任务ID
- Git自动提交(nanobot): job 7145519a
- Git自动提交(obsidian): job 5b92d81a
- A股早盘分析: job 3b40bc8a
- A股午盘分析: job e08cf2a8
- Obsidian每日总结: job 9df1412e

## 实时监控实现方案 (2026-03-12 修订)

### 架构
- **定时任务** → **skill --monitor-once** → **检测告警** → **飞书通知**
- 用户要求与早午盘分析保持一致，使用 nanobot skill 路径

### 关键路径
- **skill目录**: `~/.nanobot/workspace/skills/astock-analysis`
- **监控命令**: `cd ~/.nanobot/workspace/skills/astock-analysis && python main.py --monitor-once`
- **轻量脚本**: `~/Dropbox/mytools/myskills/astock-analysis/scripts/monitor_quick.py` (备用)

### 执行逻辑
1. cron触发 (每5分钟)
2. 执行 skill 的 --monitor-once 参数
3. 脚本检测持仓是否有触发告警
4. 有告警 → 打印 `[ALERT]` 标记 + 写入alerts_queue.txt → 调用check_alerts.py发送飞书
5. 无告警 → 静默（不发送通知）

### 飞书通知配置
- **APP_ID**: cli_a92736d6b7389cc5
- **APP_SECRET**: InRaMf8WjJ8ydlvBYdRQYRMJqLAq136E
- **CHAT_ID**: oc_1ae5f7bbe9f49bbe14691f0678fe1ed4

### check_alerts.py
- **路径**: ~/.nanobot/workspace/skills/astock-analysis/scripts/check_alerts.py
- 依赖requests模块（anaconda已包含）

## 实时监控状态 (2026-03-12)
- **已暂停**：用户要求暂停实时监控（9:45-11:30, 13:00-15:00每5分钟的任务）
- 保留5个基础任务运行

## 每日分析股票名单（合并后共16只）

| 代码 | 名称 | 来源 |
|------|------|------|
| 518880 | 黄金ETF华安 | 持仓+默认 |
| 159981 | 能源化工ETF建信 | 持仓+默认 |
| 512100 | 中证1000ETF | 持仓+默认 |
| 588380 | 双创50ETF | 持仓+默认 |
| 588200 | 科创芯片ETF | 持仓+默认 |
| 512400 | 有色金属ETF | 持仓+默认 |
| 513120 | 港股创新药ETF | 持仓+默认 |
| 588000 | 科创50ETF | 持仓+默认 |
| 588170 | 科创半导体ETF | 持仓+默认 |
| 513130 | 恒生科技ETF | 持仓+默认 |
| 002202 | 金风科技 | 持仓独有 |
| 603882 | 金域医学 | 持仓独有 |
| 159980 | 有色ETF大成 | 默认独有 |
| 159530 | 机器人ETF易方达 | 默认独有 |
| 513310 | 中韩半导体ETF | 默认独有 |

## 投资风格/偏好
- 喜欢ETF投资
- 对做T策略(正T/倒T/网格交易)感兴趣
- 想找做T自动提醒工具
- 关注中韩半导体ETF (513310)

## 网格交易学习记录 (2026-03-11)
- **513310 中韩半导体ETF**:
  - 当前价格: 4.105
  - 计划投入: 15万
  - 建议网格间距: 15%
  - 网格区间: 3.80-5.00
  - 3格设置: 3.80/4.37/5.03 各买4-5万
  - 讨论了当前价格(4.105)开始做网格的方案
  
- **588170 科创半导体ETF**:
  - 当前价格: 1.675
  - 成本: 1.841 (浮亏9%)
  - 建议网格间距: 7-8%
  - 区间: 1.55-1.94
  - 建议先等反弹到1.75减仓

- 网格间距原则: 波动大的ETF用大间距(12-15%)，波动小的用小间距(7-8%)

## 礼物推荐 (2026-03-11)
用户咨询女生生日礼物(偏好:好看+好吃)
- ADER Error 饼干礼盒 ~150元
- Godiva 巧克力礼盒 ~200元
- 荔园/轩妈蛋黄酥礼盒 ~60-80元
- T9 茶包礼盒 ~150元
- DIVA 草莓巧克力 ~100元
- 最佳组合: ADER饼干 + 荔园蛋黄酥

## 2026-03-12 系统维护记录

### 修复的问题
1. **定时任务参数错误**：原使用--analyze-morning/--analyze-afternoon（不存在），改为--stocks指定16只股票
2. **ReportType导入缺失**：handle_monitor_once函数缺少ReportType导入，已修复
3. **代码目录不同步**：~/Dropbox/mytools/myskills/和~/.nanobot/workspace/skills/astock-analysis/是不同目录，已同步修复
4. **Runtime Context显示bug**：修复loop.py中的strip逻辑，正确处理2-3行的情况

### 删除的废弃文件
- monitor_lite.py（未被使用）
- astock_monitor.sh（未被使用）

### 发现的问题
- **ProxyError**：VPN/代理无法连接东方财富数据源(eastmoney.com)，导致定时任务执行失败
- **非交易时段问题**：monitor-once在非交易时段会卡住（无实时数据+LLM超时）

### 恢复的定时任务
- 早盘分析(9:30)任务丢失，已重新创建

## astock-analysis 技能特色 (2026-03-12)

**定位**：A股智能助手，资深交易员风格

### 核心能力
- 宏观情绪感知：北向资金、成交额、市场涨跌幅
- 价值投资框架：巴菲特+段永平理念 + DCF/PEG 估值
- 智能监控告警：7条规则（止盈止损、均线交叉、RSI超买超卖等）
- 社交媒体舆情：通过 agent-reach 抓取B站、雪球、小红书
- 自动化持仓管理：本地持仓 + 实时风控
- **实时监控**: 盘中每5分钟扫描持仓，有触发告警时通过飞书通知（已暂停）

### 告警规则
- 成本线：盈利+15% / 亏损-12%
- 移动止损：从最高点回撤5%/10%
- 日内波动：个股±4%、ETF±2%
- 技术共振：MA交叉、RSI超卖/超买、成交量突增

### 监控实现
- **skill目录**: ~/.nanobot/workspace/skills/astock-analysis
- **监控命令**: cd ~/.nanobot/workspace/skills/astock-analysis && python main.py --monitor-once
- **备用轻量脚本**: ~/Dropbox/mytools/myskills/astock-analysis/scripts/monitor_lite.py (已删除)
- **告警输出**: 检测到告警时打印 `[ALERT]` 标记供agent识别
- **nanobot路径**: /Users/tlin/Dropbox/mytools/nanobot/.venv/bin/nanobot

### 重要说明
- 实时监控（monitor-once）只在交易时段(9:45-11:30, 13:00-15:00)运行有意义
- 非交易时段执行会因无实时数据+LLM调用而超时卡住

## 2026-03-13 问题记录

### 子任务结果丢失问题
- **现象**: 早盘分析任务(9:30)执行后，子任务状态显示completed，但输出结果未被正确捕获/返回给用户
- **影响**: 用户在09:43追问分析结果时，发现子任务完成但无输出
- **尝试解决**: 再次spawn新子agent尝试获取结果
- **可能原因**: 
  1. 脚本执行完成但stdout未被收集
  2. 执行过程中出现异常未正确记录
  3. subagent结果回传机制有问题
- **状态**: 调查中