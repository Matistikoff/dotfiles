#!/bin/bash
set -e

IMAGE="${1:-$HOME/Downloads/wallpaper.jpeg}"

if [ ! -f "$IMAGE" ]; then
    echo "Error: image not found: $IMAGE" >&2
    exit 1
fi

# Generate color scheme
wal -i "$IMAGE"

# Rebuild dwm with new colors (symlink already points to ~/.cache/wal/colors-wal-dwm.h)
cd "$HOME/programs/dwm/src/dwm-6.6"
make clean && make
sudo make install

# Restart dwm via sentinel file (xinitrc checks for this)
touch /tmp/dwm-restart
pkill -x dwm 2>/dev/null || true

# Update Firefox colors
pywalfox update
