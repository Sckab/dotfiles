#!/bin/bash
workspaces=$(hyprctl workspaces)
ids=$(echo "$workspaces" | grep -oP 'ID\s*\K\d+')
last=$(echo "$ids" | sort -n | tail -1)
hyprctl dispatch workspace $last
