#!/usr/bin/env bash

# ==============
# SOURCES
# ==============
source ~/.config/scripts/project-initter/lib/general-style.sh

# set gum styles
set_styles

# ==============
# ACTUAL SCRIPT
# ==============

go-mod() {
    PROJECT_NAME=$(
        gum input \
            --prompt "What is the name of the project? " \
            --placeholder "project name"
    )

    USER_NAME=$(
        gum input \
            --prompt "What is your github user name? " \
            --placeholder "user name"
    )

    export PROJECT_NAME
    export USER_NAME
}

go-init-project() {
    go-mod

    gum style \
        --border rounded \
        --border-foreground="#76946A" \
        --foreground="#76946A" \
        " Project name: \"$PROJECT_NAME\" " \
        " User name: \"$USER_NAME\" " \
        " Module name: \"github.com/$USER_NAME/$PROJECT_NAME\" "

    gum confirm \
        "Are you sure you want to continue?" || return 0

    mkdir -p "$PROJECT_NAME"

    cd "$PROJECT_NAME" || {
        gum style \
            --border rounded \
            --border-foreground="#C34043" \
            --foreground="#C34043" \
            " Failed to enter directory $PROJECT_NAME"

        return 1
    }

    go mod init github.com/"$USER_NAME"/"$PROJECT_NAME"

    mkdir -p cmd/"$PROJECT_NAME"

    touch cmd/"$PROJECT_NAME"/main.go

    gum style \
        --border rounded \
        --border-foreground="#76946A" \
        --foreground="#76946A" \
        " README.md content: " \
        " # $PROJECT_NAME "

    gum confirm \
        "You want to create a README?" || return 0

    gum style \
        --foreground="#76946A" \
        "README created succesfully" \
        "path: $(realpath README.md)"

    echo "# $PROJECT_NAME" >>README.md
}
