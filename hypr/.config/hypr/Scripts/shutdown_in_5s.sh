#!/bin/bash
# Prompt and shutdown after 5s if confirmed
choice=$(echo -e "Yes\nNo" | rofi -dmenu -p "Shutdown in 5s?")
if [[ "$choice" == "Yes" ]]; then
  sleep 5 && systemctl poweroff
fi
