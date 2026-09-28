#!/bin/bash

hyprctl dispatch 'hl.dsp.focus({ workspace = "'$(echo $(hyprctl workspaces) | grep -oP "ID\s*\K\d+" | sort -n | head -1)'", true })'
