#!/bin/bash

SYNCTHING_BIN="syncthing"

if pgrep -x "$SYNCTHING_BIN" > /dev/null 2>&1; then
    echo '{"text": "", "tooltip": "Syncthing is running", "class": "running"}'
else
    echo '{"text": "", "tooltip": "Syncthing is stopped", "class": "stopped"}'
fi