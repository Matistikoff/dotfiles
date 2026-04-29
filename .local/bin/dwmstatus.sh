#!/bin/sh

# Funkcia na konverziu číslic
to_arabic() {
    echo "$1" | sed 'y/0123456789/٠١٢٣٤٥٦٧٨٩/'
}

#!/bin/sh
while true; do
    bat=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null)
    disk=$(df -h / | awk 'NR==2{print $4}')
    hour=$(date +%-H)

    xsetroot -name "[$hour/24][${bat}%][$disk][$temp]"
    sleep 30
done
