# treeup: maybetree's modular dotfiles!

Welcome to my dotfiles repo!
These are my configs made just for me,
but hopefully other people can find them useful.

The configs in this repo are split among different
modules that are all responsible for individual
parts of my operating environment.
The `setup-*.sh` scripts apply a subset of these modules
that are relevant to a specific machine or container.

The modules themselves are stored under
`homedirs` (grafted onto the user's homedir)
and `rootdirs` (grafted onto root).

## Machines

### Orth

A thinkpad t420 running Void Linux

- `setup-orth.root.sh`
- `setup-orth.sh`

### Mistilteinn

A desktop PC running Alpine

- `setup-mistilteinn.root.sh`
- `setup-mistilteinn.sh`

### FP3

Termux running on a Fairphone 3+

- `setup-fp3.sh`
- `setup-fp3-ssh.sh` <-- not used

## Containers

I do most of my programming work inside docker containers
to avoid cluttering up the host
and mitigate the damage that can be done by potential trojans.

The `create-container-*.sh` scripts create the container
and install packges inside it,
while the `setup-container-*.sh` scripts mount
this repo into it and apply the configs.
This is done so that I can quickly apply new configs without
re-building the entire image.

- `create-container-alpine.sh`
- `create-container-void.sh`
- `setup-container-alpine.sh`
- `setup-container-void.sh`
- `setup-container-generic.sh`
- `setup-container-nix.sh` <-- broken

## Homedirs

### nvim-lite
Fairly minimal nvim config.
Features:

- Simplified tab/split navigation based on `alt` key
    - `alt` + `hjkl` moves around splits
    - `alt` + `[]` moves left and right through tabs
    - `alt` + `m` opens current buffer in new tab
    - `alt` + `esc` puts terminal buffer into normal mode
    - `alt` + `s` splits current buffer
        - direction chosen automatically
        - `alt` + `v` splits in the opposite of the automatic
            direction
    - `alt` + `t` opens terminal in new split
    - `alt` + `w` opens terminal in new tab
    - `alt` + `e` opens NetRW in current split
- Space opens fzf filepicker
- `\` then `\` again executes the last command in the first
    `terminal split in the current tab
- VimWiki commands behind F4 as leader key (work in progress)
- `j` and `k` move through logical lines, not physical
- Disable truecolor and use ansi colors
- VIM clipboard is system clipboard
- All vimscript files from `~/.config/nvim/init.vim.d`
    loaded automatically

### alacritty
Config for the best terminal emulator

### alpine-alternatives
no clue tbh

### autovenv
Automatically activate python env
if present in `./venv`, `~/venv`, or `/venv`.
For containers.

### dragon-drop
Aliases `drag` to a custom invocation of dragon-drop,
a thing that makes it easy to "drag-and-drop"
files and directories out of a terminal

### fastfetch-on-login
Run fastfetch (or whatever alternative is installed)
on login. For containers.

### fcitx-mozc
Fcitx and mozv configuration to type in English, Russian, and Japanese.
Adds `:FcitxThingy` command to nvim, which, when activated,
automatically switches between English and other languages
when you switch between normal and insert mode
(stolen from archwiki).

### force-busybox
Not used. Use busybox for all coreutils

### git
My git config with some aliases, scripts, and basic rules for git-annex

### i3lock
Lock the screen using i3lock and xss-lock

### ibus-anthy
Same as `fcitx-mozc` for when neither fcitx nor mozc are available

### locate-paranoia
This is from a dark time. Ignore it.

### loginctl-rofi
Rofi scripts to control system power state thru loginctl

### mistilteinn-screen-layout
Screen layout of mistilteinn computer

### mistilteinn-tablet
Rofi scripts to configure drawing tablet area
when connected to mistilteinn

### mpd
the best music player

### nano-is-nvim
For stubborn programs that hardcode `nano` instead of
using `$EDITOR` (unused).

### profile.d
A `~/.profile` script that sources all scripts under
`~/.profile.d` (always) and `~/.profile.login.d`
(for login shells)

### prompt
Very fancy shell prompt

### scrotsh
Rofi screenshot script using `scrot` command

### ssh
Modular config for ssh, similar to `profile.d`

### sudo-doas
Alias `sudo` to `doas` or vice-versa,
depending on which one is installed

### synclient-horiz-two-finger-scroll
Honestly no clue why this is not the default

### termux-git-annex
Update `$PATH` to include git-annex installation inside termux

### tmux
Super basic tmux config

### typos
Aliases for common typos

### usual
My usual self-made Xorg desktop environment
with bspwm, sxhkd, polybar, and rofi

### w3m
Basic config for w3m browser

### xclip-helpers
Rofi scripts to manipulate clipboard data

## Rootdirs

### alsa-pipewire
Configure pipewire to support raw alsa clients.
Most distros do this automatically, but not Void.

### elogind-suspend-then-hibernate
Enable elogind's suspend-then-hibernate feature.
When combined with disk encryption,
great for security in case of theft.

### force-evdev
Use evdev driver for input devices instead of the broken libinput driver
(no, my stylus is NOT a keyboard!!)

### intel-backlight
Bodge for a different thinkpad I was using while the T420
had a broken keyboard

### keyd
Keyd key remapping daemon. Super simple config
that makes `caps lock` into `esc`
and `caps lock` + `hjkl` into arrow keys.

### lightdm-wallpaper-orth
Unused. Sets lightdm wallpaper for lightdm on Orth
when I was still using that.

### media
A bunch of subfolder under `/media` for mounting things

### mistilteinn-misc
Misc bodges to make Alpine linux cooperate.

### nano-is-nvim
Stronger version of the homedir with the same name.
Unused.

### nix-container
unused

### runit-rshared-root
Runit script to make root have rshared propagation on system boot.
This is the default under systemd,
but not on vanilla linux.
Needed for podman, docker, and flatpak to work correctly.

### sudoers
Grant `sudo` to `wheel` and `sudo` groups

### thinkpad-t420
T420-specific stuff.
Just fan control for now.

### tpacpi-bat
Runit scripts to set battery charge limit on boot
for Orth

### xinitrc-from-display-manager
Launch xorg from display manager just by executing xinitrc.
Unused,
I just use `startx` now.

