#!/usr/bin/env bash

PROJECT_DIRS=(
    "$HOME/Programmazione/Html/angular/angular-counter"
    "$HOME/Programmazione/Html/angular/portfolio"
    "$HOME/Documents/Create-Mastery/website"
    "$HOME/Programmazione/Html/learn-react"
    "$HOME/Programmazione/TypeScript/DL"
    "$HOME/Documents/3F-informatica"
    "$HOME/Documents/github-profile"
    "$HOME/Programmazione/Cpp/FIMA"
    "$HOME/Programmazione/C#/DINFO"
    "$HOME/Programmazione/Python"
    "$HOME/.config/nvim-minimal"
    "$HOME/Programmazione/Html"
    "$HOME/Programmazione/Cpp"
    "$HOME/Programmazione/asm"
    "$HOME/Programmazione/C#"
    "$HOME/Programmazione/Go"
    "$HOME/.config/nvim-nde"
    "$HOME/website-scsdc-co"
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
    "$HOME/rage-mode"
    "$HOME/Documents"
    "$HOME/.config"
    "$HOME/tests"
    "$HOME/.zsh"
)

export PAGER=cat

chosen=$(printf "%s\n" "${PROJECT_DIRS[@]}" | fzf \
    --ansi \
    --tmux="center,60%" \
    --preview="eza --group-directories-first --color=always {}" \
    --preview-window="down,20%" \
    --header="PROJECTS" \
    --cycle)

[ -n "$chosen" ] && cd "$chosen" || return

clear
