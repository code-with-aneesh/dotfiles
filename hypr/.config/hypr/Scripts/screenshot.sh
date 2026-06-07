#!/bin/bash
# Take a screenshot of selected area and save to Pictures/Screenshots
mkdir -p "$HOME/Pictures/Screenshots"
grim -g "$(slurp)" "$HOME/Pictures/Screenshots/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png"
