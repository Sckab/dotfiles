#!/bin/bash

# This is a script for utility, made using gum and normal bash.

# global gum styles
export GUM_INPUT_CURSOR_FOREGROUND="#76946A"
export GUM_INPUT_PROMPT_FOREGROUND="#76946A"
export GUM_CHOOSE_HEADER_FOREGROUND="#76946A"
export GUM_CHOOSE_CURSOR_FOREGROUND="#76946A"
export GUM_CHOOSE_ITEM_FOREGROUND="#2A2A2A"

# ==============
# TITLE SCREEN
# ==============
TEXT=$(gum format -- "_made by Sckab_")

gum style \
    --border rounded \
    --border-foreground="#76946A" \
    --foreground="#76946A" \
    --align="center" \
    " UTILITY SCRIPT
$TEXT   "

# DRY functions
install_package() {
    gum input --prompt "what package you want to install? " --placeholder package
}

remove_package() {
    gum input --prompt "what package you want to remove? " --placeholder package
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
    gum confirm \
        --prompt.foreground="#76946A" \
        --selected.foreground="#2A2A2A" \
        --selected.background="#76946A" \
        --unselected.foreground="#76946A" \
        --unselected.background="#2A2A2A" \
        "are you sure you want to shutdown?" || return

    shutdown now
}

reboot_fn() {
    gum confirm \
        --prompt.foreground="#76946A" \
        --selected.foreground="#2A2A2A" \
        --selected.background="#76946A" \
        --unselected.foreground="#76946A" \
        --unselected.background="#2A2A2A" \
        "are you sure you want to reboot?" || return

    reboot
}

# AUR

install_aur() {
    PACKAGES=$(install_package)

    no_package "$PACKAGES" || return

    yay -S "$PACKAGES"
}

remove_aur() {
    PACKAGES=$(remove_package)

    no_package "$PACKAGES" || return

    yay -Rns "$PACKAGES"
}

update() {
    yay -Syu
}

# PACMAN

install_pacman() {
    PACKAGES=$(install_package)

    no_package "$PACKAGES" || return

    sudo pacman -S "$PACKAGES"
}

remove_pacman() {
    PACKAGES=$(remove_package)

    no_package "$PACKAGES" || return

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

        gum confirm \
            --prompt.foreground="#76946A" \
            --selected.foreground="#2A2A2A" \
            --selected.background="#76946A" \
            --unselected.foreground="#76946A" \
            --unselected.background="#2A2A2A" \
            "Are you sure you want to commit with this message: \"$COMMIT_MESSAGE\"?" || return

        git add . && git commit -m "$COMMIT_MESSAGE"

        REMOTE=$(gum input \
            --prompt "On what remote you want to push? " \
            --placeholder "remote (leave blank for the upstream)")

        BRANCH=$(gum input \
            --prompt "On what branch you want to push? " \
            --placeholder "branch (leave blank for the upstream)")

        if [ -n "$REMOTE" ] && [ -n "$BRANCH" ]; then
            git push "$REMOTE" "$BRANCH"
        else
            git push
        fi
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
    gum style --border rounded --border-foreground="#76946A" --foreground="#76946A" " Nothing selected, exiting... "
    ;;
esac
