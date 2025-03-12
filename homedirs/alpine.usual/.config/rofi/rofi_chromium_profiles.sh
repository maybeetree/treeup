#!/bin/bash

CHROMIUM_COMMAND="flatpak run com.brave.Browser"
LOCAL_STATE_FILE="$HOME/.var/app/com.brave.Browser/config/BraveSoftware/Brave-Browser/Local State"

#CHROMIUM_COMMAND="chromium"
#LOCAL_STATE_FILE="$HOME/.config/chromium/Local State"

if [ -z "$1" ]; then
	GUI_PROFILE_NAMES=$(
		jq -r '.profile.info_cache | to_entries[] | "\(.value.name)"' \
		"$LOCAL_STATE_FILE"
	)
	echo "$GUI_PROFILE_NAMES"
else
	DIR_NAME=$(
		jq -r '.profile.info_cache | to_entries[] | select(.value.name=="'"$1"'").key' \
		"$LOCAL_STATE_FILE"
	)
	test "$DIR_NAME" || exit 1
	coproc (
		sleep 0.2
		$CHROMIUM_COMMAND \
			--profile-directory="$DIR_NAME" \
			--new-window > /dev/null 2>&1
		)
fi

