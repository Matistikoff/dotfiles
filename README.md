# dotfiles

Arch Linux dotfiles for Lenovo ThinkPad X230.  
Minimal X11 setup — no desktop environment, suckless stack.

---

## System

| | |
|---|---|
| **Hardware** | Lenovo ThinkPad X230 |
| **OS** | Arch Linux (rolling) |
| **WM** | dwm 6.6 (custom build) |
| **Terminal** | st 0.9.3 (custom build) |
| **Shell** | fish |
| **Editor** | Neovim |
| **Browser** | surf / Firefox / Chromium |
| **Compositor** | picom |
| **Status bar** | custom shell script via `xsetroot` |
| **Theming** | pywal — generates colors from wallpaper |
| **Launcher** | dmenu, rofi |
| **Audio** | PipeWire |

---

## Repo structure

```
dotfiles/
├── .bashrc                         # bash config, aliases
├── .bash_profile                   # login shell, starts X on tty1
├── .xinitrc                        # X11 startup (caps→esc, dwmstatus, exec dwm)
├── .gitconfig                      # git identity and settings
│
├── .config/
│   ├── fish/                       # fish shell config
│   │   ├── config.fish             # env, abbrs, functions
│   │   ├── fish_plugins            # fisher plugin list
│   │   ├── functions/              # fish functions (fzf integrations, prompt)
│   │   ├── completions/
│   │   └── conf.d/
│   └── wal/
│       └── templates/
│           ├── colors-wal-dwm.h    # pywal → dwm color header
│           └── colors-st.h         # pywal → st color header
│
├── .local/bin/                     # personal scripts on $PATH
│   ├── dwmstatus.sh                # status bar: battery, disk, time
│   ├── change-wallpaper.sh         # apply wallpaper with pywal
│   ├── powermenu.sh                # dmenu power menu
│   ├── editmenu.sh                 # dmenu config editor
│   ├── scriptlauncher.sh           # dmenu script launcher
│   ├── quickdir.sh                 # quick directory jump
│   └── ranger_fzf.sh               # ranger + fzf integration
│
├── scripts/
│   ├── bateria_led.sh              # ThinkLight warning on low battery
│   └── nightshift.sh               # toggle gammastep + LED indicator
│
└── dotfiles-suckless/
    ├── dwm/
    │   ├── config.h                # dwm configuration
    │   └── PKGBUILD                # AUR build file
    └── st/
        ├── config.h                # st configuration
        └── PKGBUILD                # AUR build file
```

---

## Key fish functions / abbrs

| Command | Action |
|---|---|
| `e` | open nvim |
| `v` | open mpv |
| `o` | open sxiv |
| `z` | open zathura |
| `fc` | edit fish config |
| `dwmc` / `dwmi` | edit / install dwm |
| `stc` / `sti` | edit / install st |
| `wallpaper` | apply wallpaper with pywal + pywalfox |
| `ledka` / `ledkaoff` | ThinkLight on/off |
| `baterka` | show battery % |
| `baterkaStats` | full TLP battery stats |
| `monitor` / `vga` | switch between LVDS-1 and VGA-1 |
| `usb` / `usbW` | mount USB (ext4 / FAT) |
| `dot` | git alias for this dotfiles repo |

---

## Installed programs

### Suckless (compiled from source, AUR)
- **dwm** — window manager
- **st** — terminal
- **surf** — browser
- **dmenu** — launcher

### CLI
- `fish` — shell
- `neovim` — editor
- `git`, `fzf`, `fd`, `ranger` — file/search tools
- `yt-dlp` — video downloader
- `transmission-cli` — torrent
- `maim` + `xclip` — screenshot to clipboard
- `imagemagick` — image manipulation
- `zathura` + `zathura-pdf-mupdf` — PDF viewer
- `btop` — system monitor
- `fastfetch` — system info
- `tgpt` — terminal GPT
- `yay` — AUR helper

### GUI
- `firefox`, `chromium`
- `mpv` — video player
- `sxiv`, `vimiv`, `geeqie`, `gthumb` — image viewers
- `kdenlive` — video editor
- `kolourpaint` — image editor
- `pcmanfm` — file manager

### System / ThinkPad
- `tlp` + `thermald` — power management
- `pipewire` + `wireplumber` — audio
- `gammastep` — night mode (blue light filter)
- `picom` — compositor
- `python-pywal` + `python-pywalfox` — theming
- `profile-sync-daemon` — browser profile in RAM
- `iwd` — wifi
- `blueman`, `bluez` — bluetooth
- `zram-generator` — compressed swap in RAM
- `reflector` — pacman mirror ranking

---

## Updating dotfiles

```bash
dot status               # see what changed
dot add <file>           # stage file
dot commit -m "message"
dot push
```

When editing dwm/st `config.h`, also sync to the suckless folder:
```bash
cp ~/programs/dwm/src/dwm-6.6/config.h ~/dotfiles-suckless/dwm/config.h
dot add ~/dotfiles-suckless/dwm/config.h && dot commit -m "dwm: update config"
```

## Restore on a new machine

```bash
git clone --bare git@github.com:Matistikoff/dotfiles.git ~/dotfiles
alias dot='git --git-dir=$HOME/dotfiles --work-tree=$HOME'
dot checkout
dot config status.showUntrackedFiles no
```
