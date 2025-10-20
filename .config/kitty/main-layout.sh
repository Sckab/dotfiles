#!/bin/bash

# Wait a moment for the tab to be fully created
sleep 0.1

# Step 1: Spawn a window named Main with ncmpcpp opened
kitty @ launch --type=window --tab-title=Main --cwd ~ --keep-focus sh -c "(pgrep mpd || mpd) && ncmpcpp || exec zsh"

# Step 2: Create a vertical split on the right of ncmpcpp with cava
kitty @ launch --type=window --cwd ~ --match title:Main --location=after --keep-focus sh -c "cava; exec zsh"
