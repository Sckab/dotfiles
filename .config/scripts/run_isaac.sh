#!/bin/bash

if ! command -v steam &>/dev/null; then
    echo "Steam non trovato! Installa Steam prima."
    exit 1
fi

GAME_ID=250900

steam steam://rungameid/$GAME_ID
