#!/bin/bash

# find všetky súbory a odovzdaj do fzf -> vyber
FILE=$(find ~/ -type f | fzf)

# ak sa niečo vybralo
if [ -n "$FILE" ]; then
    # zistí priečinok súboru
    DIR=$(dirname "$FILE")
    # pošle signál do otvoreného rangeru, aby sa presunul
    ranger --choosefile="$FILE" "$DIR"
fi

