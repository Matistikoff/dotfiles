#!/bin/bash

# Na
source "${HOME}/.cache/wal/colors.sh"

# Položky menu
OPTIONS="shutdown\nreboot"

# Vyber položku cez dmenu s farbami z pywal
CHOICE=$(echo -e "$OPTIONS" | dmenu -i -p "pocitac chcem:" \
    -fn "Bm437 IBM VGA 8x16:size=16" \
    -nb "$color0" \
    -nf "$color7" \
    -sb "$color1" \
    -sf "$color7")

case $CHOICE in
    vypnut)
        sudo systemctl poweroff
        ;;
    restartnut)
        sudo systemctl reboot
        ;;
esac

