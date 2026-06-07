#!/bin/bash
# Prompt to suspend
choice=$(echo -e "Yes\nNo" | rofi -dmenu -p "Suspend?")
if [[ "$choice" == "Yes" ]]; then
  systemctl suspend
fi
