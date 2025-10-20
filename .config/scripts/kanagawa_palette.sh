#!/bin/bash

# Define Kanagawa colors (Dragon variant)
declare -A kanagawa=(
  [bg]="#1F1F28"
  [fg]="#DCD7BA"
  [red]="#C34043"
  [green]="#76946A"
  [yellow]="#C0A36E"
  [blue]="#7E9CD8"
  [magenta]="#957FB8"
  [cyan]="#6A9589"
  [orange]="#FFA066"
  [pink]="#D27E99"
  [teal]="#658594"
  [violet]="#938AA9"
  [gray]="#727169"
)

# Print title
echo -e "\n🌅 \e[1mKANAGAWA COLOR PALETTE (Dragon)\e[0m 🌅"
echo    "─────────────────────────────────────"

# Print the colors
for name in "${!kanagawa[@]}"; do
  hex="${kanagawa[$name]}"
  echo -e "\e[48;2;$(printf '%d;%d;%d' 0x${hex:1:2} 0x${hex:3:2} 0x${hex:5:2})m  \e[0m $name → $hex"
done

echo    "─────────────────────────────────────"
