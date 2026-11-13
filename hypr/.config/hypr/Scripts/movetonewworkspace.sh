#!/bin/bash
# ~/.config/hypr/Scripts/movetonewworkspace.sh

reserved=(9)

used=$(hyprctl workspaces -j | jq -r '[.[].id] | join(" ")')

next_ws=2
while [[ " $used " == *" $next_ws "* ]] || [[ " ${reserved[*]} " == *" $next_ws "* ]]; do
    next_ws=$((next_ws + 1))
done

# Move active window to the next free workspace and switch
hyprctl dispatch "hl.dsp.window.move({ workspace = $next_ws })"
hyprctl dispatch "hl.dsp.focus({ workspace = $next_ws })"
