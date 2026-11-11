#!/usr/bin/env bash
# Pick a random wallpaper from /home/aneesh/Pictures/wallpapers and set it via hyprpaper.

set -euo pipefail

WALLPAPERS_DIR="/home/aneesh/Pictures/wallpapers"

files=()
while IFS= read -r -d $'\0' f; do
  files+=("$f")
done < <(find "$WALLPAPERS_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.jxl" \) -print0 2>/dev/null)

if [[ ${#files[@]} -eq 0 ]]; then
  notify-send "Hyprpaper" "No wallpapers found in $WALLPAPERS_DIR" || true
  exit 1
fi

selected="$(printf "%s\n" "${files[@]}" | shuf -n1)"

if command -v hyprctl >/dev/null 2>&1; then
  hyprctl hyprpaper wallpaper ",$selected" || true
  notify-send "Hyprpaper" "Wallpaper set: $(basename "$selected")" || true
else
  notify-send "Hyprpaper" "hyprctl not found" || true
  echo "hyprctl not found" >&2
  exit 2
fi
