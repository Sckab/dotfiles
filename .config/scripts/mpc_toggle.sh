#!/bin/bash
status=$(mpc status | grep -o '\[playing\]')

if [ "$status" == "[playing]" ]; then
    mpc pause
else
    mpc play
fi
