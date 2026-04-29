setxkbmap -option caps:escape;
xset r rate 200 50;
xinput disable "TPPS/2 IBM TrackPoint";
pywalfox update &
~/.local/bin/dwmstatus.sh &

# Loop: restart dwm if sentinel file exists, otherwise exit session
while true; do
    dwm
    [ -f /tmp/dwm-restart ] && rm /tmp/dwm-restart || break
done
