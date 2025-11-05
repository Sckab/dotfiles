#!/bin/bash

# This is a script for utility, made using gum and normal bash.

# global gum styles
export GUM_INPUT_CURSOR_FOREGROUND="#76946A"
export GUM_INPUT_PROMPT_FOREGROUND="#76946A"
export GUM_CHOOSE_HEADER_FOREGROUND="#76946A"
export GUM_CHOOSE_CURSOR_FOREGROUND="#76946A"
export GUM_CHOOSE_ITEM_FOREGROUND="#2A2A2A"

# DRY functions
install_package() {
    gum input --prompt "what package you want to install? " --placeholder package
}

remove_package() {
    gum input --prompt "what package you want to remove? " --placeholder package
}

# ==============
# FUNCTIONS FOR SCRIPT
# ==============

shutdown_fn() {
    shutdown now
}

reboot_fn() {
    reboot
}

# AUR

install_aur() {
    PACKAGES=$(install_package)

    yay -S "$PACKAGES"
}

update() {
    yay -Syu
}

remove_aur() {
    PACKAGES=$(remove_package)

    yay -Rns "$PACKAGES"
}

# PACMAN

install_pacman() {
    PACKAGES=$(install_package)

    sudo pacman -S "$PACKAGES"
}

remove_pacman() {
    PACKAGES=$(remove_package)

    sudo pacman -Rns "$PACKAGES"
}

# OTHER

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
    if [ ! -d .git ]; then
        gum style \
            --border rounded \
            --border-foreground="#C34043" \
            --foreground="#C34043" \
            " NOT IN A GIT REPO "

        return
    else
        COMMIT_MESSAGE=$(gum input --prompt "write the message: " --placeholder "message")

        ORIGIN_BRANCH=$(gum input \
            --prompt "on what branch and remote you want to push? " \
            --placeholder "remote and branch (leave blank for the upstream)")

        GIT_PUSH_AND_COMMIT=$(git add . && git commit -m "$COMMIT_MESSAGE" && git push "$ORIGIN_BRANCH")

        gum confirm && $GIT_PUSH_AND_COMMIT
    fi
}

# ==============
# ACTUAL SCRIPT
# ==============

SELECTION=$(
    gum choose \
        --header "Choose what you want to do" \
        --height=11 \
        "shutdown" "reboot" "update" "install from aur" "remove from aur" "install from pacman" "remove from pacman" "tree" "kanagawa palette" "open a file" "commit"
)

case "$SELECTION" in
"shutdown")
    shutdown_fn
    ;;

"reboot")
    reboot_fn
    ;;

"update")
    update
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

"tree")
    tree_fn
    ;;

"kanagawa palette")
    kanagawa
    ;;

"open a file")
    open_file
    ;;

"commit")
    commit
    ;;

*)
    echo default
    ;;
esac
