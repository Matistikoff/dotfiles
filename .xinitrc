setxkbmap -option caps:escape;
xset r rate 200 50;
xinput disable "TPPS/2 IBM TrackPoint";
pywalfox update &
~/.local/bin/dwmstatus.sh &
exec dwm
