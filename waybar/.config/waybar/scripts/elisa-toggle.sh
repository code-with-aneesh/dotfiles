#!/usr/bin/env bash
# Toggle the currently playing music window between the current workspace and hidden workspace 9.
# Window resolution prefers a title match (track title or "YouTube Music"), so it picks the
# music-playing window even when several browser windows share the same class.

player=$(playerctl -l 2>/dev/null | head -n 1)
title=$(playerctl metadata title 2>/dev/null)
base="${player%%.*}"

clients=$(hyprctl clients -j 2>/dev/null)

addr=""

# 1) match the window whose title contains the current track title
if [ -n "$title" ]; then
    addr=$(printf '%s' "$clients" | jq -r --arg t "$title" '.[] | select(.title | contains($t)) | .address' | head -n 1)
fi

# 2) match a YouTube Music page
if [ -z "$addr" ] || [ "$addr" = "null" ]; then
    addr=$(printf '%s' "$clients" | jq -r '.[] | select(.title | ascii_downcase | test("youtube music")) | .address' | head -n 1)
fi

# 3) fallback: any known music-player / browser window class
if [ -z "$addr" ] || [ "$addr" = "null" ]; then
    addr=$(printf '%s' "$clients" | jq -r '
        .[] | select(.class | test("^(brave-origin|brave-browser|chromium|chromium-browser|google-chrome|org\\.mozilla\\.firefox|org\\.kde\\.elisa|elisa)$")) | .address
    ' | head -n 1)
fi

# 4) fallback: class candidates derived from the player name
if [ -z "$addr" ] || [ "$addr" = "null" ]; then
    for c in "$base" "org.kde.$base" "org.mozilla.$base" "org.gnome.$base" "$player"; do
        addr=$(printf '%s' "$clients" | jq -r --arg c "$c" '.[] | select(.class == $c) | .address' | head -n 1)
        if [ -n "$addr" ] && [ "$addr" != "null" ]; then break; fi
    done
fi

# nothing to toggle
if [ -z "$addr" ] || [ "$addr" = "null" ]; then
    exit 0
fi

music_ws=$(printf '%s' "$clients" | jq -r --arg a "$addr" '.[] | select(.address == $a) | .workspace.id')
cur=$(hyprctl activeworkspace -j 2>/dev/null | jq -r '.id')

if [ "$music_ws" = "9" ]; then
    hyprctl dispatch "hl.dsp.window.move({ workspace = $cur, window = \"address:$addr\" })"
    hyprctl dispatch "hl.dsp.focus({ window = \"address:$addr\" })"
else
    hyprctl dispatch "hl.dsp.window.move({ workspace = 9, window = \"address:$addr\" })"
    cur_now=$(hyprctl activeworkspace -j 2>/dev/null | jq -r '.id')
    if [ "$cur_now" != "$cur" ]; then
        hyprctl dispatch "hl.dsp.focus({ workspace = $cur })"
    fi
fi
