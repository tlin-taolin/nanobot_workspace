# ocr — Project Details

## Description
Image text recognition skill using Tesseract OCR.

## Configuration (2026-03-09)
- **Tool**: Tesseract v5.5.2 + leptonica (via `brew`).
- **Languages**: 163 languages (including `chi_sim`).
- **Flow**: Image Send -> Download via `curl` -> Tesseract OCR -> Return text.

## Known Issues
- Currently only recognizes left side of images, right side info lost.
- Needs optimization.
