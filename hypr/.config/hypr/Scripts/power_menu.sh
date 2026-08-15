#!/bin/bash
# Power menu via rofi
choice=$(echo -e "Shutdown\nReboot\nSuspend\nLock\nExit Hyprland\nCancel" | rofi -dmenu -p "Power Menu")
case "$choice" in
  Shutdown) systemctl poweroff ;;
  Reboot) systemctl reboot ;;
  Suspend) systemctl suspend ;;
  Lock) hyprlock ;;
  "Exit Hyprland") hyprctl dispatch 'hl.dsp.exit()' ;;
  *) exit 0 ;;
esac
