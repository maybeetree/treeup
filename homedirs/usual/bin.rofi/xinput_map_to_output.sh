#!/bin/sh

sleep 1

choice1="$(xinput --list --name-only | dmenu -i)"

if [ -z "$choice1" ]
then
	exit 1
fi

choice2="$(xrandr | grep ' connected' | cut -d ' ' -f 1 | dmenu -i)"

if [ -z "$choice2" ]
then
	exit 1
fi

xinput map-to-output "$choice1" "$choice2"

