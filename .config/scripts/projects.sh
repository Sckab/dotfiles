#!/usr/bin/env bash

PROJECT_DIRS=(
    "$HOME/Programmazione/lua/nvim_plugins/gh-templates"
    "$HOME/Programmazione/lua/nvim_plugins/note_taker"
    "$HOME/Documents/Create-Mastery/website"
    "$HOME/Programmazione/lua/nvim_plugins"
    "$HOME/Programmazione/Html/portfolio"
    "$HOME/Programmazione/Python/pact"
    "$HOME/Programmazione/Rust/fima"
    "$HOME/Documents/github-profile"
    "$HOME/Programmazione/C#/DINFO"
    "$HOME/Programmazione/Python"
    "$HOME/Programmazione/Rust"
    "$HOME/Programmazione/Html"
    "$HOME/Programmazione/lua"
    "$HOME/Programmazione/Cpp"
    "$HOME/Programmazione/zig"
    "$HOME/Programmazione/asm"
    "$HOME/Programmazione/C#"
    "$HOME/Programmazione/Go"
    "$HOME/.config/ghostty"
    "$HOME/Documents/scsdc"
    "$HOME/.config/scripts"
    "$HOME/.config/waybar"
    "$HOME/.config/kitty"
    "$HOME/Programmazione"
    "$HOME/.config/tmux"
    "$HOME/.config/rofi"
    "$HOME/.config/hypr"
    "$HOME/.config/nvim"
    "$HOME/Documents"
    "$HOME/.config"
    "$HOME/tests"
    "$HOME/.zsh"
)

clear

CHOSEN=$(
    printf "%s\n" "${PROJECT_DIRS[@]}" | fzf \
        --popup="center,30%" \
        --style="minimal" \
        --border-label=" PROJECTS " \
        --scheme="path" \
        --color="fg:#d0d0d0,fg+:#d0d0d0,bg:#181616,bg+:#181616" \
        --color="hl:#76946A,hl+:#76946A,info:#76946A,marker:#C34043" \
        --color="prompt:#76946A,spinner:#658594,pointer:#76946A,header:#658594" \
        --color="border:#76946A,label:#76946A,query:#d0d0d0" \
        --border-label-pos="0" \
        --prompt="> " \
        --separator="─" \
        --border="rounded" \
        --cycle \
        --ansi
)

[ -n "$CHOSEN" ] && cd "$CHOSEN"

clear
