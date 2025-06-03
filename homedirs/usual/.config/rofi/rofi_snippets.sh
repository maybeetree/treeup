#!/bin/bash

DIR=~/DATA/me/snippets

cd "$DIR"

if [ -z "$1" ]; then
	find . -type f
else
	FILE="$1"
	#{ test -f "$FILE" || test -d "$FILE" || test -L "$FILE"; } || exit 1
	coproc ( cat "$FILE" | head -c -1 | pbcopy )
fi

