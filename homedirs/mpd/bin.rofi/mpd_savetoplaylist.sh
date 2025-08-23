#!/bin/bash

# If these are not unset and dmenu is a symlink to rofi,
# things will break.
unset ROFI_RETV
unset ROFI_OUTSIDE

if [ -z "$XDG_CONFIG_HOME" ]
then
	XDG_CONFIG_HOME=~/.config
fi

MUSIC_DIR=$(grep -m 1 -E '^\s*playlist_directory\s+' "$XDG_CONFIG_HOME/mpd/mpd.conf" | awk '{printf $2}' | tr -d \" | tr -d \')

choice="$(mpc lsplaylists | dmenu)" || { echo "No choice." ; exit 1; }
MUSIC_DIR="${MUSIC_DIR/#\~/$HOME}"

#echo $MUSIC_DIR/$choice.m3u
mpc current -f '%file%' >> "$MUSIC_DIR/$choice.m3u"


