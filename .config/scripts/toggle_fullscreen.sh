#!/bin/bash

focused_win=$(hyprctl activewindow -j | jq '.id')
if [ -z "$focused_win" ]; then
  echo "No active window found"
  exit 1
fi

fullscreen=$(hyprctl clients -j | jq ".[] | select(.id==$focused_win) | .state.fullscreen")

if [ "$fullscreen" = "true" ]; then
  hyprctl dispatch fullscreenoff "$focused_win"
else
  hyprctl dispatch fullscreen "$focused_win"
fi
