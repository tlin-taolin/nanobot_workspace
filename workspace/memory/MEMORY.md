# Long-term Memory

This file stores important information that should persist across sessions.

## User Information
- User is Chinese-speaking (prefers Chinese language)
- User is interested in AI agent skills and automation
- **Obsidian文件格式偏好**: Cubox风格，包含frontmatter元数据（id、cubox_url、url、create_time、tags）

## Preferences
- Uses ClawHub for skill management
- Interested in self-improvement and productivity skills

## Python环境配置 (重要！)
- **大部分 skill 应使用 anaconda Python**: `/opt/homebrew/anaconda3/bin/python3`
- **nanobot CLI 路径**: `/Users/tlin/Dropbox/mytools/nanobot/.venv/bin/nanobot`
- 避免直接调用 `python3`，应优先使用 anaconda 环境

## Project Context
- Exploring various ClawHub skills for AI agent capabilities
- Installed skills stored in ~/.nanobot/workspace/skills/

## 持仓数据 (2026-03-12)
- **位置**: `~/.nanobot/workspace/skills/astock-analysis/scripts/data/portfolio.json`
- **格式**: JSON，以股票代码为key，包含stock_code、stock_name、quantity、cost_price、entry_date、last_update

## ClawHub Skills Analysis

### Successfully Installed & Then Deleted
- **asset-allocation** (codeblackhole1024) - CFA framework-based investment advisory. Features: risk assessment
- **tavily-search** - 已删除（剩余8个skills）

### 技能安装位置
- obsidian-topic-cubox-summary 实际安装在 ~/.agents/skills/

## 定时任务 (2026-03-12 更新)

| 时间 | 任务 | 备注 |
|------|------|------|
| 6:00 | Git自动提交（nanobot·6:00） | 脚本: ~/.nanobot/scripts/nanobot_git_commit.sh |
| 6:30 | Git自动提交（obsidian·6:30） | 仓库: ~/obsidian_sync |
| 9:30 | A股早盘分析（9:30·16只） | |
| 14:30 | A股午盘分析（14:30·16只） | |
| 11:30 | Obsidian每日总结（11:30） | 脚本: /Users/tlin/Dropbox/mytools/myskills/scripts/run_daily_summary.sh |
| 9:45-11:30 | A股实时监控（每5分钟） | cron job: cd ~/.nanobot/workspace/skills/astock-analysis && python main.py --monitor-once |
| 13:00-15:00 | A股实时监控（每5分钟） | cron job: cd ~/.nanobot/workspace/skills/astock-analysis && python main.py --monitor-once |

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

### 定时任务ID (2026-03-12)
- Git自动提交(nanobot): job 7145519a
- Git自动提交(obsidian): job 5b92d81a
- A股早盘分析: job 1bb223f5
- A股午盘分析: job 17d513ad
- Obsidian每日总结: job 9df1412e
- A股实时监控(早盘): job 029c3b26 (每5分钟 9:45-11:30)
- A股实时监控(午盘): job 9d59129e (每5分钟 13:00-15:00)

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
- 修复astock-analysis技能运行问题：需从正确目录`~/.nanobot/workspace/skills/astock-analysis/`运行，否则会出现`ModuleNotFoundError: No module named 'src.data_provider'`
- 发现akshare_fetcher.py存在bug：`unsupported operand type(s) for -: 'float' and 'Config'`，导致ETF实时行情获取失败
- 恢复7个定时任务（之前消失）

## astock-analysis 技能特色 (2026-03-12)

**定位**：A股智能助手，资深交易员风格

### 核心能力
- 宏观情绪感知：北向资金、成交额、市场涨跌幅
- 价值投资框架：巴菲特+段永平理念 + DCF/PEG 估值
- 智能监控告警：7条规则（止盈止损、均线交叉、RSI超买超卖等）
- 社交媒体舆情：通过 agent-reach 抓取B站、雪球、小红书
- 自动化持仓管理：本地持仓 + 实时风控
- **实时监控**: 盘中每5分钟扫描持仓，有触发告警时通过飞书通知

### 告警规则
- 成本线：盈利+15% / 亏损-12%
- 移动止损：从最高点回撤5%/10%
- 日内波动：个股±4%、ETF±2%
- 技术共振：MA交叉、RSI超卖/超买、成交量突增

### 监控实现
- **skill目录**: ~/.nanobot/workspace/skills/astock-analysis
- **监控命令**: cd ~/.nanobot/workspace/skills/astock-analysis && python main.py --monitor-once
- **备用轻量脚本**: ~/Dropbox/mytools/myskills/astock-analysis/scripts/monitor_lite.py
- **告警输出**: 检测到告警时打印 `[ALERT]` 标记供agent识别
- **nanobot路径**: /Users/tlin/Dropbox/mytools/nanobot/.venv/bin/nanobot