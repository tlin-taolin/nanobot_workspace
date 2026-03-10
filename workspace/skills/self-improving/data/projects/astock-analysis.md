# astock-analysis — Project Details

## Description
A-share, HK-share, and US-share stock analysis skill.

## Configuration (2026-03-09)
- **Environment**: Anaconda Python (no venv)
- **Python Path**: `/opt/homebrew/anaconda3/bin/python`
- **Script Path**: `~/Dropbox/mytools/myskills/astock-analysis/scripts/main.py`
- **Report Output**: `~/Dropbox/mytools/myskills/astock-analysis/scripts/reports/`

## Stock List (8 ETFs)
`512100, 518880, 159980, 159530, 588200, 588380, 513310, 588000`
(金融ETF, 黄金ETF, 有色ETF, 机器人ETF, 证券ETF, 创新药ETF, 煤炭ETF, 科创ETF)

## Automation
- **Cron Job ID**: `e8f0eb0f`
- **Schedule**: Every day at 09:30 AM
- **Action**: Execute analysis and push reports to Feishu.

## Recent Results (2026-03-09)
- **Top Picks**: 518880 (黄金ETF, 78分), 159980 (有色ETF, 65分), 159530 (机器人ETF, 58分).
- **Poor Performance**: 588380 (创新药ETF, 20分).
