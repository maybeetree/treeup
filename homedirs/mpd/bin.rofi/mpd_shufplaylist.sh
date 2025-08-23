#!/bin/sh

# If these are not unset and dmenu is a symlink to rofi,
# things will break.
unset ROFI_RETV
unset ROFI_OUTSIDE

choice="$(mpc lsplaylists | dmenu)"
if [ -z "$choice" ]
then
	exit 1
fi
mpc clear
sleep 0.1
mpc load "$choice"
sleep 0.1
mpc shuffle
sleep 0.1
mpc play 
sleep 0.1

