#!/bin/bash

echo -en "\0use-hot-keys\x1ftrue\n"

function termopen () {
	if test -d "$1"
	then
		cd "$1"
	elif test -f "$1"
	then
		cd "$(dirname "$1")"
	fi

	alacritty
}

function open () {
	case $1 in 
		
		open)
			coproc ( handlr open "$2" > /dev/null  2>&1 )
			;;
		type)
			coproc ( sleep 0.2; xdotool keyup Control Alt Super; xdotool type "$2" > /dev/null  2>&1 )
	
			;;
		
		copy)
			coproc ( echo -n \"$2\" | pbcopy > /dev/null  2>&1 )
			;;
		
		folder)
			coproc ( thunar "$2" > /dev/null  2>&1)
		
			;;
		drag)
			coproc ( dragon-drop -a -x "$2" > /dev/null  2>&1 )
			;;
	esac
}

if [ -z "$1" ]; then
	~/.config/rofi/find.sh | sed 's|^/home/maybetree|~|'
	#find ~/DATA/world/Archive/youtube -iname '*.webm' -maxdepth 2
else
	#bash ~/DATA/me/Programs/binmat/"$1" & disown
	#d $MATMENU
	cd "$MATMENU"
	#FILE="$1"
	FILE=$(echo "$1" | sed 's|^~|/home/maybetree|')
	{ test -f "$FILE" || test -d "$FILE" || test -L "$FILE"; } || exit 1
	
	case $ROFI_RETV in
		1 )
			open open "$FILE"
			;;
		10 )
			open type "$FILE"
			;;
		11 )
			open copy "$FILE"
			;;
		12 )
			open folder "$FILE"
			;;
		13 )
			open drag "$FILE"
			;;
		14 )
			coproc ( termopen "$FILE" > /dev/null 2>&1 )
			;;
		* )
			coproc (
				sleep 0.2
				open $(
				echo -e "open\ntype\ncopy\nfolder\ndrag" |
					rofi -dmenu) \
				"$FILE" > /dev/null  2>&1
			)
			;;
	esac
fi

