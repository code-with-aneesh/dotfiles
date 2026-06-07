#!/bin/bash
# Prompt to exit Hyprland
choice=$(echo -e "Yes\nNo" | rofi -dmenu -p "Exit Hyprland?")
if [[ "$choice" == "Yes" ]]; then
  hyprctl dispatch exit
fi
