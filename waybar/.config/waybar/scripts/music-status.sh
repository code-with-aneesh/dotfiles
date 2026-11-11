#!/bin/sh

artist=$(playerctl -p elisa metadata artist 2>/dev/null || true)
title=$(playerctl -p elisa metadata title 2>/dev/null || true)
album=$(playerctl -p elisa metadata album 2>/dev/null || true)

track="$artist"
[ -n "$title" ] && [ -n "$track" ] && track="$track — $title"
[ -z "$track" ] && track="Elisa"

tooltip="$track"
[ -n "$album" ] && tooltip="$tooltip\n$album"

json_escape() {
    printf '%s' "$1" | sed 's/\\/\\\\/g; s/"/\\"/g; s/$/\\n/; $s/\\n$//'
}

printf '{"text":"%s","tooltip":"%s"}\n' \
    "$(json_escape "$track")" \
    "$(json_escape "$tooltip")"
