#!/usr/bin/env bash
# Pick a random wallpaper from a directory and tell hyprpaper to preload and set it.
# Usage: hyprpaper-random-next.sh

set -euo pipefail

# User-configurable: directory containing wallpapers (set in environment or default path)
WALLPAPERS_DIR="${WALLPAPERS_DIR:-$HOME/Pictures/catppuccin-wallpapers}"

# Expand colon-separated dirs into array
IFS=':' read -r -a DIRS <<< "$WALLPAPERS_DIR"

# Collect image files
files=()
for d in "${DIRS[@]}"; do
  # expand ~
  d_expanded="${d/#\~/$HOME}"
  if [[ -d "$d_expanded" ]]; then
    while IFS= read -r -d $'\0' f; do
      files+=("$f")
    done < <(find "$d_expanded" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.jxl" \) -print0 2>/dev/null)
  fi
done

if [[ ${#files[@]} -eq 0 ]]; then
  notify-send "Hyprpaper" "No wallpapers found in $WALLPAPERS_DIR" || true
  exit 1
fi

# Choose a random file different from currently active if possible
shuffile() {
  # emit random element from files
  printf "%s\n" "${files[@]}" | shuf -n1
}

selected="$(shuffile)"

# Preload then set the wallpaper for all monitors
if command -v hyprctl >/dev/null 2>&1; then
  hyprctl hyprpaper preload "$selected" || true
  # set for all monitors (empty monitor means all)
  hyprctl hyprpaper wallpaper "",$selected || hyprctl hyprpaper wallpaper "$selected" || true
  notify-send "Hyprpaper" "Wallpaper set: $(basename "$selected")" || true
else
  notify-send "Hyprpaper" "hyprctl not found" || true
  echo "hyprctl not found" >&2
  exit 2
fi
