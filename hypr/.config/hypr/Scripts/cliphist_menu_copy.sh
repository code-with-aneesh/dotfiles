#!/bin/bash
# Show cliphist entries in rofi and copy selected item to clipboard
cliphist list | rofi -dmenu | cliphist decode | wl-copy
