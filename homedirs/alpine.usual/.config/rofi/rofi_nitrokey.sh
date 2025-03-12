#!/bin/bash

# Set this to your `nitropy` executable
# if it's not already in $PATH
nitropy="nitropy"

function autotype () {
	sleep 0.4
	code=$("$nitropy" nk3 secrets get-otp "$1" | tail -n 1)
	sleep 0.4
	xdotool type "$code"
}

if [ -z "$1" ]; then
	"$nitropy" nk3 secrets list 2> /dev/null | cut -f 1
else
	name="$1"
	test "$name" || exit 0
	name=$(echo "$name" | cut -c 5-)
	coproc ( autotype "$name" > /dev/null 2>&1 )
fi


