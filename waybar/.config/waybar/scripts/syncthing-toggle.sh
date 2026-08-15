#!/bin/bash

SYNCTHING_BIN="syncthing"
WEBUI_URL="http://localhost:8384"

if pgrep -x "$SYNCTHING_BIN" > /dev/null 2>&1; then
    pkill "$SYNCTHING_BIN"
else
    "$SYNCTHING_BIN" &
    sleep 2
    xdg-open "$WEBUI_URL"
fi