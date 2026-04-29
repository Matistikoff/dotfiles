#!/bin/bash

# Interval medzi kontrolami (v sekundách)
INTERVAL=60

# Funkcia na bliknutie LED
blink_led() {
    local times=$1
    local delay=0.5  # pol sekundy
    for ((i=0; i<times; i++)); do
        echo 1 | sudo tee /sys/class/leds/tpacpi::thinklight/brightness >/dev/null
        sleep $delay
        echo 0 | sudo tee /sys/class/leds/tpacpi::thinklight/brightness >/dev/null
        sleep $delay
    done
}

# Nekonečný loop
while true; do
    # Získať kapacitu batérie
    battery=$(cat /sys/class/power_supply/BAT0/capacity)

    if [ "$battery" -lt 10 ]; then
        # Ak menej ako 5%, blikaj LEDku 10 krát
        blink_led 10
    fi

    sleep $INTERVAL
done

