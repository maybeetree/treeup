#!/bin/bash

FIREFOX_COMMAND="flatpak run io.gitlab.librewolf-community"
INI_FILE="$HOME/.var/app/io.gitlab.librewolf-community/.librewolf/profiles.ini"


if [ -z "$1" ]; then
	PROFILE_NAMES=$(grep 'Name=' "$INI_FILE" | cut -d '=' -f 2-)
	echo "$PROFILE_NAMES"
else
	coproc (
		sleep 0.2
		$FIREFOX_COMMAND -P "$1" > /dev/null 2>&1
	)
fi

