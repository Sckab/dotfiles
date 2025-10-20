#!/bin/bash

kitty zellij &

sleep 0.1

new_win=$(hyprctl activewindow -j | jq '.id')

hyprctl dispatch fullscreen "$new_win"
