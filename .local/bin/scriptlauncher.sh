#!/bin/bash

# Načítaj farby z pywal
source "${HOME}/.cache/wal/colors.sh"

# Načítaj všetky .sh skripty z ~/.local/bin
SCRIPTS=$(find "$HOME/.local/bin" -maxdepth 1 -type f -name "*.sh" -printf "%f\n" | sort)

# Vyber skript cez dmenu
CHOICE=$(echo "$SCRIPTS" | dmenu -i -p "Run script:" \
    -fn "Bm437 IBM VGA 8x16:size=20" \
    -nb "$color0" \
    -nf "$color7" \
    -sb "$color1" \
    -sf "$color7")

# Ak si niečo vybral, spusti skript v termináli
if [ -n "$CHOICE" ]; then
    # Otvor terminál a spusti skript
    st -e nvim "$HOME/.local/bin/$CHOICE"
fi
