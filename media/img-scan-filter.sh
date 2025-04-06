#!/bin/bash

# Usage: img-scan-filter.sh [target-directory]
# Default: current directory

TARGET_DIR="${1:-.}"
OUTPUT_DIR="$TARGET_DIR/output"

mkdir -p "$OUTPUT_DIR"

echo "Processing images in '$TARGET_DIR' → output to '$OUTPUT_DIR'..."

cd "$TARGET_DIR" || exit 1

EXTENSIONS=("*.jpg" "*.jpeg" "*.png")

for ext in "${EXTENSIONS[@]}"; do
  for img in $ext; do
    [ -f "$img" ] || continue
    echo "  → $img"
    convert "$img" \
      -auto-level \
      -brightness-contrast 0x95 \
      -sharpen 0x2 \
      -threshold 10% \
      -resize 1080x \
      -transparent white \
      "$OUTPUT_DIR/$img"
  done
done

echo "✅ Done."

