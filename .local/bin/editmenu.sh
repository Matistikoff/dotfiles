#!/bin/bash

# Na
source "${HOME}/.cache/wal/colors.sh"

# Položky menu
OPTIONS="DWM\nST\nHOW"

# Vyber položku cez dmenu s farbami z pywal
CHOICE=$(echo -e "$OPTIONS" | dmenu -i -p "EDIT:" \
    -fn "Bm437 IBM VGA 8x16:size=16" \
    -nb "$color0" \
    -nf "$color7" \
    -sb "$color1" \
    -sf "$color7")

case $CHOICE in
    DWM)
        st -e nvim ${HOME}/programs/dwm/src/dwm-6.6/config.h
        ;;
    ST)
        st -e nvim ${HOME}/programs/st/src/st-0.9.3/config.h
        ;;
    HOW)
        st -e nvim ${HOME}/howto.txt
        ;;
esac
