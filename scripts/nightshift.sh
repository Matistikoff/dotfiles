#!/bin/sh

export DISPLAY=:0
export XAUTHORITY=$HOME/.Xauthority

DAY=6500
NIGHT=4500
LED=/sys/class/leds/platform::micmute/brightness

# vždy zruš starý stav (anti-stack)
pkill -x gammastep 2>/dev/null
gammastep -x 2>/dev/null

if [ "$(cat $LED)" = "1" ]; then
    # vypni night mode (fade späť na DAY)
    echo 0 | sudo tee $LED >/dev/null
else
    # zapni night mode (FADE)
    echo 1 | sudo tee $LED >/dev/null
    gammastep -m randr -l 90:0 -t $DAY:$NIGHT &
fi

