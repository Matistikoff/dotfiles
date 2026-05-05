#ifndef CONFIG_H
#define CONFIG_H

// String used to delimit block outputs in the status.
#define DELIMITER "  "

// Maximum number of Unicode characters that a block can output.
#define MAX_BLOCK_OUTPUT_LENGTH 8192

// Control whether blocks are clickable.
#define CLICKABLE_BLOCKS 1

// Control whether a leading delimiter should be prepended to the status.
#define LEADING_DELIMITER 0

// Control whether a trailing delimiter should be appended to the status.
#define TRAILING_DELIMITER 0


//    X("󰋊", "df -h / | awk 'NR==2{print $4}'", 60, 3)                     
//    X("󰍛", "free -h | awk '/^Mem/ {print $3\"/\"$2}'", 10, 4)             
//    X("󰁹", "cat /sys/class/power_supply/BAT0/capacity 2>/dev/null | awk '{print $1\"%\"}'", 30, 9) 
//    X("󰚭", "date '+%a %d.%m  %H:%M:%S'", 1, 10)
//    X("󰕾", "~/scripts/volume.sh", 1, 1) 
//    X("", "~/scripts/cava.sh", 1, 1) 

// Define blocks for the status feed as X(icon, cmd, interval, signal).
#define BLOCKS(X)                                                              \
    X("", "~/scripts/vumeter.sh", 0, 1) \

#endif  // CONFIG_H
