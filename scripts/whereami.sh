#!/bin/sh

set -e

whereami=$(curl -s "https://ipapi.co/json" | jq -r '"\(.latitude):\(.longitude)"')
filtered=$(printf '%s' "$whereami" | tr -cd '0-9.:')

if [ "$whereami" != "$filtered" ]
then
	echo "Something's wrong!!" 1>&2
	exit 1
fi

printf 'export WHEREAMI=%s\n' "$whereami" > ~/.profile.login.d/80-whereami.local.sh

