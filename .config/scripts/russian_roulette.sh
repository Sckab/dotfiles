#!/bin/bash

shutdown_sequence() {
  echo "Shutdown in: "
  for i in {3..1}; do
    echo "$i..."
    sleep 1
  done
  echo "💀 Bye bye!"
  shutdown now
}

commands=(
  "btop"
  "exa --icons"
  "ls --color=auto"
  "cd / && pwd"
  "neofetch"
  "clear"
  "tty-clock -c -C 2 -s -S"
  "fortune"
  "cowsay 'Moo 🐮'"
  "speedtest-cli"
  "htop"
  "tree -C -L 2"
  "cat ~/.config/ascii_arts/among_us.txt"
  "date"
  "uptime"
  "ip a"
  "nano"
  "nvim"
  "vim"
)

commands+=( "shutdown_sequence" )

choice=${commands[$RANDOM % ${#commands[@]}]}

if [[ "$choice" == "shutdown_sequence" ]]; then
  shutdown_sequence
else
  eval "$choice"
fi
