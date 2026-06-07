#!/bin/bash
# ~/.config/hypr/Scripts/cycle_workspaces.sh

current=$(hyprctl activeworkspace -j | jq '.id')
workspaces=$(hyprctl workspaces -j | jq '.[].id' | sort -n)

next=0
found=0
for ws in $workspaces; do
    if [[ $found -eq 1 ]]; then
        next=$ws
        break
    fi
    if [[ $ws -eq $current ]]; then
        found=1
    fi
done

# If we reached the end, go to the first workspace
if [[ $next -eq 0 ]]; then
    next=$(echo "$workspaces" | head -n1)
fi

hyprctl dispatch workspace "$next"
