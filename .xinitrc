setxkbmap -option caps:escape;
xset r rate 200 50;
# Restore last pywal colors (sets wallpaper via feh + loads Xresources for ST)
wal -R &
xinput disable "TPPS/2 IBM TrackPoint";
pywalfox update &
dwmblocks &
# ~/.local/bin/dwmstatus.sh &

# Loop: restart dwm if sentinel file exists, otherwise exit session
while true; do
    dwm
    [ -f /tmp/dwm-restart ] && rm /tmp/dwm-restart || break
done
