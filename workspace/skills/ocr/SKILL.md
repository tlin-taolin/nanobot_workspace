---
name: ocr
description: 使用 Tesseract OCR 从图片中提取文字。适用于飞书/Telegram 等平台发来的图片链接。
metadata: {"nanobot": {"emoji": "📸", "requires": {"bins": ["tesseract"]}, "install": [{"id": "brew", "kind": "brew", "formula": "tesseract", "bins": ["tesseract"], "label": "Install tesseract (brew)"}, {"id": "lang", "kind": "manual", "label": "下载中文语言包: brew install tesseract-lang"}]}}
---

# OCR Skill

从图片中提取文字。

## 使用方法

### 方式1：图片URL
提供图片链接，我会自动下载并识别：

```
https://example.com/image.jpg
```

### 方式2：飞书/Telegram 图片
飞书/Telegram 的图片通常是 OSS 链接，直接提供给我即可。

## OCR 命令（供技能内部使用）

```bash
# 1. 下载图片
curl -L -o /tmp/ocr_input.jpg "<图片URL>"

# 2. 图像预处理（提高识别率）
/opt/homebrew/anaconda3/bin/python -c "
import cv2
img = cv2.imread('/tmp/ocr_input.jpg')
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
thresh = cv2.adaptiveThreshold(gray, 255, cv2.ADAPTIVE_THRESH_GAUSSIAN_C, cv2.THRESH_BINARY, 11, 2)
cv2.imwrite('/tmp/ocr_preprocessed.png', thresh)
"

# 3. 识别（中英文混合）
cd /tmp && tesseract ocr_preprocessed.png stdout -l eng+chi_sim 2>&1 | grep -v "Estimating"
```

## 依赖

- **tesseract**: `brew install tesseract`
- **语言包**: `brew install tesseract-lang` (包含中文)

## 注意事项

- 识别效果取决于图片清晰度
- 建议使用英文+中文混合模式: `-l eng+chi_sim`
- 过滤掉 tesseract 的状态信息 (Estimating...)
