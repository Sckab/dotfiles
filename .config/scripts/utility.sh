#!/bin/bash

# This is a script for utility, made using gum and normal bash.

shutdown_fn() {
    shutdown now
}

reboot_fn() {
    reboot
}

# AUR

install_aur() {
    PACKAGES=$(gum input --prompt "what package you want to install? " --placeholder package)

    yay -S "$PACKAGES"
}

update() {
    yay -Syu
}

remove_aur() {
    PACKAGES=$(gum input --prompt "what package you want to remove? " --placeholder package)

    yay -Rns "$PACKAGES"
}

# PACMAN

install_pacman() {
    PACKAGES=$(gum input --prompt "what package you want to install? " --placeholder package)

    sudo pacman -S "$PACKAGES"
}

remove_pacman() {
    PACKAGES=$(gum input --prompt "what package you want to remove? " --placeholder package)

    sudo pacman -Rns "$PACKAGES"
}

# OTHER

projects() {
    . ~/.config/scripts/projects.sh
}

tree_fn() {
    tree . -I 'node_modules|.next|.nuxt|dist|out|.cache|bin|obj|TestResults|__pycache__|venv|.idea|.vscode|.git' --dirsfirst -C
}

kanagawa() {
    ~/.config/scripts/kanagawa_palette.sh
}

open_file() {
    FILE=$(gum input --prompt "what file you want to open? " --placeholder "file name")

    gum pager <"$FILE"
}

commit() {
    COMMIT_MESSAGE=$(gum input --prompt "write the message: " --placeholder "message")

    git add . && git commit -m "$COMMIT_MESSAGE" && git push
}

# ==============
# ACTUAL SCRIPT
# ==============

SELECTION=$(gum choose shutdown reboot update "install from aur" "remove from aur" "install from pacman" "remove from pacman" projects tree "kanagawa palette" "open a file" commit --header "Choose what you want to do")

case "$SELECTION" in
shutdown)
    shutdown_fn
    ;;

reboot)
    reboot_fn
    ;;

"install from aur")
    install_aur
    ;;

"remove from aur")
    remove_aur
    ;;

"install from pacman")
    install_pacman
    ;;

"remove from pacman")
    remove_pacman
    ;;

projects)
    projects
    ;;

tree)
    tree_fn
    ;;

"kanagawa palette")
    kanagawa
    ;;

"open a file")
    open_file
    ;;

commit)
    commit
    ;;

*)
    echo default
    ;;
esac
