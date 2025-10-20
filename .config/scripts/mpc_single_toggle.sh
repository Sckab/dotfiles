#!/bin/bash
mpc single

if mpc status | grep -q 'single: on'; then
    notify-send "MPD" "Modalità single ATTIVATA"
else
    notify-send "MPD" "Modalità single DISATTIVATA"
fi
