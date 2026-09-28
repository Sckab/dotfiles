#!/usr/bin/env bash

#!/bin/bash

# Author: Tasos Latsas

# spinner.sh
#
# Display an awesome 'spinner' while running your long shell commands
#
# Do *NOT* call _spinner function directly.
# Use {start,stop}_spinner wrapper functions

# usage:
#   1. source this script in your's
#   2. start the spinner:
#       start_spinner [display-message-here]
#   3. run your command
#   4. stop the spinner:
#       stop_spinner [your command's exit status]
#
# Also see: test.sh

function _spinner() {
    case "$1" in
    start)
        local message="$2"
        local sp="⣾⣽⣻⢿⡿⣟⣯⣷"
        local i=0

        while true; do
            printf '\r\e[38;2;118;148;106m%s\e[0m %s' \
                "${sp:i++%${#sp}:1}" \
                "$message"

            sleep 0.08
        done
        ;;

    stop)
        if [[ -z "$3" ]]; then
            echo "spinner is not running.." >&2
            return 1
        fi

        kill "$3" 2>/dev/null
        wait "$3" 2>/dev/null

        printf '\r\033[K' >&2
        ;;
    esac
}

function start_spinner {
    # $1 : msg to display
    _spinner "start" "${1}" &
    # set global spinner pid
    _sp_pid=$!
    disown
}

function stop_spinner {
    # $1 : command exit status
    _spinner "stop" "$1" "$_sp_pid"
    unset _sp_pid
}

export GUM_SPIN_SPINNER_FOREGROUND="#76946A"

fastfetch

echo

ask_update() {
    gum confirm \
        --prompt.foreground="#76946A" \
        --selected.foreground="#2A2A2A" \
        --selected.background="#76946A" \
        --unselected.foreground="#76946A" \
        --unselected.background="#2A2A2A" \
        "You want to update the system?" || return

    START_TIME=$(date +%s)

    paru -Syu \
        --noconfirm \
        --removemake \
        --cleanafter

    echo -e "\e[32mUpdating Oh My Posh:\e[0m"

    oh-my-posh upgrade --force

    echo -e "\e[32mUpdating rust:\e[0m"

    rustup update

    echo -e "\e[32mUpdating npm and pnpm:\e[0m"

    sudo npm install -g npm@latest
    sudo pnpm self-update

    echo -e "\e[32mUpdating uv:\e[0m"

    uv self update

    END_TIME=$(date +%s)

    ELAPSED=$((END_TIME - START_TIME))

    if [[ $ELAPSED -ge 3600 ]]; then
        TIME=$(printf "%02d:%02d:%02d" "$((ELAPSED / 3600))" "$(((ELAPSED / 60) % 60))" "$((ELAPSED % 60))")
    elif [[ $ELAPSED -ge 60 ]]; then
        TIME=$(printf "%2d:%02d" "$((ELAPSED / 60))" "$((ELAPSED % 60))")
    else
        TIME=$(printf "0:%02d" "$ELAPSED")
    fi

    echo -e "\e[32mIt took $TIME. Press any key to continue\e[0m"
    read -n 1 -r -s
}

if not ping -c 1 -W 2 8.8.8.8 &>/dev/null; then
    echo -e "\e[31mYou don't have internet connection. Press any key to continue\e[0m"
    read -n 1 -r -s
else
    start_spinner "Getting AUR updates..."

    UPDATES_AUR=$(paru -Qu)

    stop_spinner $?

    start_spinner "Getting pacman updates..."

    UPDATES_PACMAN=$(pacman -Qu)

    stop_spinner $?

    UPDATES_AUR=$(printf '%s\n' "$UPDATES_AUR" | wc -l)
    UPDATES_PACMAN=$(printf '%s\n' "$UPDATES_PACMAN" | wc -l)

    [[ $UPDATES_PACMAN -ge 1 ]] && UPDATES_PACMAN=$((UPDATES_PACMAN - 1))

    TOTAL_UPDATES=$((UPDATES_AUR + UPDATES_PACMAN))

    DASHES=$(echo "Total  -> $TOTAL_UPDATES" | sed "s/./-/g")

    echo -e "\e[32mUPDATES\e[0m"
    echo -e "\e[32m$DASHES\e[0m"
    echo -e "\e[32mPacman -> \e[0m$UPDATES_PACMAN"
    echo -e "\e[32mAUR    -> \e[0m$UPDATES_AUR"
    echo -e "\e[32m$DASHES\e[0m"
    echo -e "\e[32mTotal  -> \e[0m$TOTAL_UPDATES"

    echo

    ask_update
fi

tmux new-session
