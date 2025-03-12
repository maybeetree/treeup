#!/bin/sh

bindir=~/bin.rofi

if [ -z "$1" ]; then
	ls "$bindir"
else
	file="$bindir/$1"
	echo | sh -c "echo | $file 2>&1 > /dev/null &" 2>&1 > /dev/null &
	#coproc "$FILE"
fi

