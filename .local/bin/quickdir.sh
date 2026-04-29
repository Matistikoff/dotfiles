#!/bin/bash

# Načítaj farby z pywal
source "${HOME}/.cache/wal/colors.sh"

# Automaticky načítaj všetky priečinky z HOME
# -maxdepth 1 = len priečinky priamo v HOME, nie podpriečinky
# -type d = len directories (priečinky)
# -printf "%f\n" = vypíš len názov priečinka, nie celú cestu
DIRECTORIES=$(find "$HOME" -maxdepth 1 -type d -printf "%f\n" | sort)

# Vyber priečinok cez dmenu
CHOICE=$(echo "$DIRECTORIES" | dmenu -i -p "Open directory:" \
    -fn "Bm437 IBM VGA 8x16:size=16" \
    -nb "$color0" \
    -nf "$color7" \
    -sb "$color1" \
    -sf "$color7")

# Ak si niečo vybral, otvor terminál v tom priečinku
if [ -n "$CHOICE" ]; then
    st -e sh -c "cd '$HOME/$CHOICE' && exec $SHELL"
fi
