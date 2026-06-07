#!/bin/bash
# Create a new workspace (max id + 1) and switch to it
hyprctl dispatch workspace $(( $(hyprctl workspaces -j | jq "[.[] | .id] | max // 0") + 1 ))
