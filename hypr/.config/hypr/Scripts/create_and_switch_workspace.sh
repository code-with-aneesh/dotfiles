#!/bin/bash
# Create a new workspace (max id + 1) and switch to it
next_ws=$(( $(hyprctl workspaces -j | jq "[.[] | .id] | max // 0") + 1 ))
hyprctl dispatch "hl.dsp.focus({ workspace = $next_ws })"
