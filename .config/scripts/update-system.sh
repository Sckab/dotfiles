#!/usr/bin/env bash

export GUM_SPIN_SPINNER_FOREGROUND="#76946A"

fastfetch

echo

ask_update() {
    gum confirm \
        --prompt.foreground="#76946A" \
        --selected.foreground="#2A2A2A" \
        --selected.background="#76946A" \
        --unselected.foreground="#76946A" \
        --unselected.background="#2A2A2A" \
        "You want to update the system?" || return

    yay -Syu
}

UPDATES_AUR=$(gum spin --spinner dot --title "Getting AUR updates..." -- yay -Qu | wc -l)
UPDATES_PACMAN=$(gum spin --spinner dot --title "Getting pacman updates..." -- pacman -Qu | wc -l)

UPDATES_PACMAN=$((UPDATES_PACMAN - 1))

TOTAL_UPDATES=$((UPDATES_AUR + UPDATES_PACMAN))

dashes=$(echo "Total  -> $TOTAL_UPDATES" | sed "s/./-/g")

echo -e "\e[32mUPDATES\e[0m"
echo -e "\e[32m$dashes\e[0m"
echo -e "\e[32mPacman -> \e[0m$UPDATES_PACMAN"
echo -e "\e[32mAUR    -> \e[0m$UPDATES_AUR"
echo -e "\e[32m$dashes\e[0m"
echo -e "\e[32mTotal  -> \e[0m$TOTAL_UPDATES"

echo

ask_update

tmux new-session
