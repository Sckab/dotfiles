#!/bin/bash

# This is a script for utility, made using gum and normal bash.

# global gum styles
export GUM_INPUT_CURSOR_FOREGROUND="#76946A"
export GUM_INPUT_PROMPT_FOREGROUND="#76946A"
export GUM_CHOOSE_HEADER_FOREGROUND="#76946A"
export GUM_CHOOSE_CURSOR_FOREGROUND="#76946A"
export GUM_CHOOSE_ITEM_FOREGROUND="#2A2A2A"
export GUM_CONFIRM_PROMPT_FOREGROUND="#76946A"
export GUM_CONFIRM_SELECTED_FOREGROUND="#2A2A2A"
export GUM_CONFIRM_SELECTED_BACKGROUND="#76946A"
export GUM_CONFIRM_UNSELECTED_FOREGROUND="#76946A"
export GUM_CONFIRM_UNSELECTED_BACKGROUND="#2A2A2A"

COLS=$(tput cols)
ROWS=$(tput lines)

SCRIPTS_DIR="$(dirname "$(readlink -f "$0")")"

# ==============
# TITLE SCREEN
# ==============
HEADER_TEXT="Choose what you want to do:"
TEXT=$(gum format -- "_made by Sckab_")

HEADER=$(gum style \
    --border rounded \
    --border-foreground="#76946A" \
    --foreground="#76946A" \
    --align="center" \
    --width="$((${#HEADER_TEXT} - 2))" \
    "UTILITY  SCRIPT
$TEXT ")

# DRY functions
install_package_aur() {
    yay -Slaq |
        fzf --tmux="center,60%" -m \
            --preview='yay -Si {}' \
            --preview-window="right:60%,wrap" \
            --bind 'space:toggle-preview'
}

install_package_pacman() {
    comm -23 <(pacman -Slq | sort) <(pacman -Qq | sort) |
        fzf --tmux="center,60%" -m \
            --preview='pacman -Si {}' \
            --preview-window="right:60%,wrap" \
            --bind 'space:toggle-preview'
}

remove_package_list() {
    pacman -Qq |
        fzf --tmux="center,60%" -m \
            --preview='yay -Si {}' \
            --preview-window="right:60%,wrap" \
            --bind 'space:toggle-preview'
}

no_package() {
    if [ -z "$1" ]; then
        gum style \
            --border rounded \
            --border-foreground="#C34043" \
            --foreground="#C34043" \
            " NO PACKAGE PROVIDED "

        return 1
    fi
}

# ==============
# FUNCTIONS FOR SCRIPT
# ==============

shutdown_fn() {
    TEXT="are you sure you want to shutdown?"

    LENGTH=${#TEXT}

    PAD_H=$(((COLS - LENGTH) / 2))
    PAD_V=$(((ROWS - 3) / 2))
    ((PAD_H < 0)) && PAD_H=0
    ((PAD_V < 0)) && PAD_V=0

    gum confirm \
        --no-show-help \
        --padding="$PAD_V $PAD_H" \
        "$TEXT" || return

    shutdown now
}

reboot_fn() {
    TEXT="are you sure you want to reboot?"

    LENGTH=${#TEXT}

    PAD_H=$(((COLS - LENGTH) / 2))
    PAD_V=$(((ROWS - 3) / 2))
    ((PAD_H < 0)) && PAD_H=0
    ((PAD_V < 0)) && PAD_V=0

    gum confirm \
        --no-show-help \
        --padding="$PAD_V $PAD_H" \
        "$TEXT" || return

    reboot
}

# AUR

install_aur() {
    PACKAGES=$(install_package_aur)

    no_package "$PACKAGES" || return

    yay -S "$PACKAGES"
}

update() {
    yay -Syu
}

# PACMAN

install_pacman() {
    PACKAGES=$(install_package_pacman)

    no_package "$PACKAGES" || return

    sudo pacman -S "$PACKAGES"
}

remove_package() {
    PACKAGES=$(remove_package_list)

    no_package "$PACKAGES" || return

    sudo pacman -Rns "$PACKAGES"
}

# ==============
# ACTUAL SCRIPT
# ==============

OPTIONS=("shutdown" "reboot" "browse projects" "update" "install from aur" "install from pacman" "remove a package")
HEADER+="
$HEADER_TEXT"

ITEM_WIDTH=0

for OPT in "${OPTIONS[@]}" "$HEADER_TEXT"; do
    ((${#OPT} > ITEM_WIDTH)) && ITEM_WIDTH=${#OPT}
done

SELECTION=$(
    gum choose \
        --header "$HEADER" \
        --height=${#OPTIONS} \
        --no-show-help \
        "${OPTIONS[@]}"
)

clear

case "$SELECTION" in
"shutdown")
    shutdown_fn
    ;;

"reboot")
    reboot_fn
    ;;

"browse projects")
    "$SCRIPTS_DIR/projects.sh"
    ;;

"update")
    update
    ;;

"install from aur")
    install_aur
    ;;

"install from pacman")
    install_pacman
    ;;

"remove a package")
    remove_package
    ;;
*)
    gum style --border rounded --border-foreground="#76946A" --foreground="#76946A" " Nothing selected, exiting... "
    ;;
esac
