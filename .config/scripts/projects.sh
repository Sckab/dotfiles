#!/usr/bin/env bash

PROJECT_DIRS=(
    "$HOME/Programmazione/C#/DINFO"
    "$HOME/website-create-mastery"
    "$HOME/Programmazione/Python"
    "$HOME/Programmazione/C#"
    "$HOME/Programmazione/Go"
    "$HOME/.config/nvim-nde"
    "$HOME/website-scsdc-co"
    "$HOME/Documents/scsdc"
    "$HOME/.config/scripts"
    "$HOME/.config/hypr"
    "$HOME/.config/nvim"
    "$HOME/rage-mode"
    "$HOME/.config"
    "$HOME/tests"
)

export PAGER=cat

chosen=$(printf "%s\n" "${PROJECT_DIRS[@]}" | fzf \
    --ansi \
    --height=99% \
    --border=rounded \
    --prompt=" " \
    --header="PROJECTS" \
    --preview 'printf "\n" && exa --icons --color=always {} && printf "\n\033[1;32m─ TREE ──────────────────────────────────────────────────────────────────\n\n" && tree {} -I "node_modules|.next|.nuxt|dist|out|.cache|bin|obj|TestResults|__pycache__|venv|.idea|.vscode|.git" --dirsfirst -C' \
    --preview-window=right:40% --cycle \
    --reverse)

[ -n "$chosen" ] && cd "$chosen"
