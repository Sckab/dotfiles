#!/bin/bash

hyprctl dispatch 'hl.dsp.focus({ workspace = "'$(echo $(hyprctl workspaces) | grep -oP "ID\s*\K\d+" | sort -n | tail -1)'", true })'
