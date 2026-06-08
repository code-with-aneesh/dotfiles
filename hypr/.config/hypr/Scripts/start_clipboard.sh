#!/bin/bash
# ~/.config/hypr/Scripts/start_clipboard.sh

# Kill any existing cliphist/wl-paste processes to prevent duplication
pkill wl-paste
sleep 0.1

/usr/bin/nohup /usr/bin/wl-paste --watch /usr/bin/cliphist store >/dev/null 2>&1 &
/usr/bin/nohup /usr/bin/wl-paste --type image --watch /usr/bin/cliphist store >/dev/null 2>&1 &
