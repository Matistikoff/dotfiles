#!/bin/bash
wal -i "$1"
pywalfox update

# Urob ho spustiteľným
chmod +x ~/.local/bin/change-wallpaper.sh
