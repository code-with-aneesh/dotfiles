#!/bin/bash
# ~/.config/hypr/Scripts/movetonewworkspace.sh

# Get highest current workspace ID
max_ws=$(hyprctl workspaces -j | jq "[.[].id] | max // 0")
next_ws=$((max_ws + 1))

# Move active window to new workspace and switch
hyprctl dispatch movetoworkspace "$next_ws"
hyprctl dispatch workspace "$next_ws"
