#!/bin/bash
# Create a new workspace (lowest free id after 1, skipping reserved) and switch to it

reserved=(9)

used=$(hyprctl workspaces -j | jq -r '[.[].id] | join(" ")')

next_ws=2
while [[ " $used " == *" $next_ws "* ]] || [[ " ${reserved[*]} " == *" $next_ws "* ]]; do
    next_ws=$((next_ws + 1))
done

hyprctl dispatch "hl.dsp.focus({ workspace = $next_ws })"
