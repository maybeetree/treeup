#!/bin/bash

# If these are not unset and dmenu is a symlink to rofi,
# things will break.
unset ROFI_RETV
unset ROFI_OUTSIDE


if [ -z "$XDG_CONFIG_HOME" ]
then
	XDG_CONFIG_HOME=~/.config
fi

MUSIC_DIR=$(grep -m 1 -E '^\s*music_directory\s+' "$XDG_CONFIG_HOME/mpd/mpd.conf" | awk '{printf $2}' | tr -d \" | tr -d \')
MUSIC_DIR="${MUSIC_DIR/#\~/$HOME}"

#CHOICE="$(mpc -f '%title%' listall | dmenu)" || exit 1;

cd "$MUSIC_DIR"
CHOICE="$(find . | cut -c 3- | dmenu -i)" || exit 1;

mpc insert "$CHOICE"

#echo "$CHOICE" | head -n 1 | xargs -d'\n' mpc search any | head -n 1 | xargs -d'\n' mpc insert
mpc play

