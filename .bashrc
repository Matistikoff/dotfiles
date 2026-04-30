#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=nvim
export VISUAL=nvim
alias e='nvim' 
alias ..='cd ..' 
alias ls='ls --color=auto'
alias aliasy='e ~/.bashrc' 
alias grep='grep --color=auto'
alias ledka='echo 1 | sudo tee /sys/class/leds/tpacpi::thinklight/brightness'
alias ledkaoff='echo 0 | sudo tee /sys/class/leds/tpacpi::thinklight/brightness'
alias baterka='cat /sys/class/power_supply/BAT0/capacity'
alias hidden='ls -d .*'
alias fonty='fc-list'
alias dwmc='cd ~/programs/dwm/src/dwm-6.6 && nvim config.h'
alias dwmi='cd ~/programs/dwm/src/dwm-6.6 && sudo make clean install && touch /tmp/dwm-restart && kill $(pidof dwm)'
alias blocksi='cd ~/programs/dwmblocks-async && sudo make clean install && kill $(pidof dwmblocks-async) ; dwmblocks-async &'
alias stc='cd ~/programs/st/src/st-0.9.3 && nvim config.h'
alias sti='cd ~/programs/st/src/st-0.9.3 && sudo make clean install'
alias wallpaper='wal -i ~/Downloads/wallpaper.jpeg && pywalfox update'
alias howto='cd ~ && nvim howto.txt'
alias rm='rm -i'
alias nainstalovanePac='pacman -Qen'
alias nainstalovaneAur='pacman -Qem'
alias torrent='transmission-cli'
alias usb='sudo mount /dev/sdc1 ~/usb'
alias usbW='sudo mount -t vfat /dev/sdc1 ~/usb/   -o rw,uid=$(id -u),gid=$(id -g),umask=022'
alias v='mpv'
alias o='sxiv'
alias status='nvim ~/.local/bin/dwmstatus.sh'
alias ~='cd ~'
alias trackpoint='sudo modprobe -r psmouse && sudo modprobe psmouse'
alias monitor='xrandr --output LVDS-1 --auto --output VGA-1 --off'
alias vga='xrandr --output LVDS-1 --off --output VGA-1 --auto'
alias ll='ls -lah --color=auto'

PS1='[\u@\h \W]\$ '
export RANGER_LOAD_DEFAULT_RC=FALSE

# dotfiles bare repo
alias dot='git --git-dir=$HOME/dotfiles --work-tree=$HOME'
