#!/usr/bin/env bash

# This is the script for git, it will be used by all the others files
# This will just create a git repo and setting the remote, and pushing

# ==============
# SOURCES
# ==============
source ./general-style.sh

# set gum styles
set_styles

# ==============
# ACTUAL SCRIPT
# ==============

git-branch() {
    BRANCH_NAME=$(
        gum input \
            --prompt "What is the branch name you want to set? " \
            --placeholder "branch name (leave blank for main)"
    )

    if [[ -n "$BRANCH_NAME" && $BRANCH_NAME != "main" ]]; then
        git branch -M "$BRANCH_NAME"
    else
        git branch -M main
        BRANCH_NAME="main"
    fi

    export BRANCH_NAME
}

git-remote() {
    GITHUB_LINK=$(
        gum input \
            --prompt "What is the github link? " \
            --placeholder "github link"
    )

    if [[ -z "$GITHUB_LINK" ]]; then
        gum style \
            --border rounded \
            --border-foreground="#76946A" \
            " No remote link provided, skipping remote setup. "

        return
    fi

    git remote add origin "$GITHUB_LINK"
}

git-main() {
    gum confirm "You want to create a git repo?" ||
        {
            gum style \
                --border rounded \
                --border-foreground="#76946A" \
                --foreground="#76946A" \
                " The project will not be in a git repo "

            return 0
        }

    git init
    git add .
    git commit -m "first commit"

    git-branch

    git-remote

    git push -u origin "$BRANCH_NAME"

    gum style \
        --border rounded \
        --border-foreground="#76946A" \
        --foreground="#76946A" \
        " Git repo created and pushed succesfully "
}
