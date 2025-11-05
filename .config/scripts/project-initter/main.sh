#!/usr/bin/env bash

# This is a simple collection of script that will init a project.
# This is the main file.
# This collection uses gum for a beautiful TUI
# made by Sckab
# github: https://github.com/Sckab

# ==============
# SOURCES
# ==============
source ~/.config/scripts/project-initter/lib/general-style.sh
source ~/.config/scripts/project-initter/lib/language/go.sh
source ~/.config/scripts/project-initter/lib/git.sh

# set gum styles
set_styles

PROJECT_TYPE=$(
    gum choose \
        --header "What language is the project written in?" \
        "Go" "C#" "Web" "Python" "C" "C++" "Rust" "Java"
)

case "$PROJECT_TYPE" in
"Go")
    go-init-project

    git-main
    ;;

*) ;;
esac
