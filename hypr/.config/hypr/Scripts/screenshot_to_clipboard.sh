#!/bin/bash
# Capture selected area and copy image to clipboard
grim -g "$(slurp)" - | wl-copy
