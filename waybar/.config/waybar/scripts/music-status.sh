#!/usr/bin/env bash

artist=$(playerctl metadata artist 2>/dev/null || true)
title=$(playerctl metadata title 2>/dev/null || true)
album=$(playerctl metadata album 2>/dev/null || true)

track="$artist"
[ -n "$title" ] && [ -n "$track" ] && track="$track — $title"
[ -z "$track" ] && track="Elisa"

display_track="$track"
if [ "${#track}" -gt 20 ]; then
    state_file="${XDG_RUNTIME_DIR:-/tmp}/waybar-music-scroll"
    previous_track=""
    offset=0
    if [ -f "$state_file" ]; then
        IFS= read -r previous_track < "$state_file"
        IFS= read -r offset < <(tail -n 1 "$state_file")
    fi
    if [ "$previous_track" != "$track" ] || ! [[ "$offset" =~ ^[0-9]+$ ]]; then
        offset=0
    fi
    scroll_text="$track   •   $track"
    display_track="${scroll_text:offset:20}"
    offset=$(( (offset + 1) % ( ${#track} + 7 ) ))
    {
        printf '%s\n' "$track"
        printf '%s\n' "$offset"
    } > "$state_file"
fi

tooltip="$track"
[ -n "$album" ] && tooltip="$tooltip\n$album"

json_escape() {
    printf '%s' "$1" | sed 's/\\/\\\\/g; s/"/\\"/g; s/$/\\n/; $s/\\n$//'
}

printf '{"text":"%s","tooltip":"%s"}\n' \
    "$(json_escape "$display_track")" \
    "$(json_escape "$tooltip")"
