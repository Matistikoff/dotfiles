# ======================
# ENV
# ======================
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx BROWSER firefox
set -g fish_greeting
# fish_vi_key_bindings
set -g fish_cursor_default block blink
set -g fish_cursor_insert line blink
set -g fish_cursor_replace_one underscore blink


# ======================
# ABBR (aliasy)
# ======================
abbr e 'nvim'
abbr .. 'cd ..'
abbr '~' 'cd ~'
abbr ls 'ls --color=auto'
abbr ll 'ls -lah --color=auto'
abbr grep 'grep --color=auto'
abbr hidden 'ls -d .*'
abbr fonty 'fc-list'
abbr rm 'rm -i'
abbr nainstalovanePac 'pacman -Qen'
abbr nainstalovaneAur 'pacman -Qem'
abbr torrent 'transmission-cli'
abbr v 'mpv'
abbr o 'sxiv'
abbr fc 'nvim ~/.config/fish/config.fish'
abbr status 'nvim ~/.local/bin/dwmstatus.sh'
abbr howto 'cd ~ && nvim howto.txt'
abbr readme 'cd ~ && nvim README.md'

# ======================
# DWM / ST
# ======================
function dwmc
    cd ~/programs/dwm/src/dwm-6.6
    nvim config.h
end

function dwmi
    cd ~/programs/dwm/src/dwm-6.6
    sudo make clean install
    and touch /tmp/dwm-restart
    and kill (pidof dwm)
end

function blockse
    cd ~/programs/dwmblocks-async
    nvim config.h
end

function blocksi
    cd ~/programs/dwmblocks-async
    sudo make clean install
    kill (pidof dwmblocks) 2>/dev/null
    dwmblocks &
end

function stc
    cd ~/programs/st/src/st-0.9.3
    nvim config.h
end

function sti
    cd ~/programs/st/src/st-0.9.3
    sudo make clean install
end

# ======================
# THINKPAD / HW
# ======================
function ledka
    echo 1 | sudo tee /sys/class/leds/tpacpi::thinklight/brightness > /dev/null
end

function ledkaoff
    echo 0 | sudo tee /sys/class/leds/tpacpi::thinklight/brightness > /dev/null
end

function baterka
    cat /sys/class/power_supply/BAT0/capacity
end

function trackpoint
    sudo modprobe -r psmouse
    sudo modprobe psmouse
end

# ======================
# USB
# ======================
function usb
    sudo mount /dev/sdc1 ~/usb
end

function usbW
    sudo mount -t vfat /dev/sdc1 ~/usb -o rw,uid=(id -u),gid=(id -g),umask=022
end

# ======================
# X / MONITORY
# ======================
function monitor
    xrandr --output LVDS-1 --auto --output VGA-1 --off
end

function vga
    xrandr --output LVDS-1 --off --output VGA-1 --auto
end

# ======================
# WALLPAPER
# ======================
function wallpaper
    set img $argv[1]
    if test -z "$img"
        set img ~/Downloads/wallpaper.jpeg
    end
    ~/.local/bin/change-wallpaper.sh "$img"
end

# ======================
# AUTOSTART X (tty1)
# ======================
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = "1"
	exec startx
    end
end

# ===================== YY to clipboard

function __fish_vi_y_clipboard
    commandline --current-buffer | xclip -selection clipboard
end

function wristwatch
    mpv https://www.youtube.com/watch?v=OF7zHTxuFvk 
end

function wristwatchSolo
    mpv https://www.youtube.com/watch?v=OF7zHTxuFvk --start=00:02:52
end


function baterkaStats
    sudo tlp-stat -b
end

function z
    zathura
end


bind -M vicmd Y '__fish_vi_y_clipboard'


# Ponechaj len kritické fzf
bind \cr _fzf_search_history
bind \cf _fzf_search_directory
bind \cp fzf_file_select

# System paste
bind -M insert \cv fish_clipboard_paste
bind -M default \cv fish_clipboard_paste





# dotfiles bare repo
abbr --add dot 'git --git-dir=$HOME/dotfiles --work-tree=$HOME'
