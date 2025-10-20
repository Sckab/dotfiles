#!/bin/bash
workspaces=$(hyprctl workspaces)
ids=$(echo "$workspaces" | grep -oP 'ID\s*\K\d+')
first=$(echo "$ids" | sort -n | head -1)
hyprctl dispatch workspace $first

