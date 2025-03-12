#!/bin/bash

echo -en "\0use-hot-keys\x1ftrue\n"
cd $PASSWORD_STORE_DIR

if [ -z "$1" ]; then
	#ls $PASSWORD_STORE_DIR | sed 's/\.gpg$//'
	find . -type f -name '*.gpg' | sed 's/.gpg$//' | cut -c 3-
else
	NAME=$1
	PASSTEXT=$(pass show "$NAME")
	FIRSTLINE=$(echo "$PASSTEXT" | sed '1q;d')
	SECONDLINE=$(echo "$PASSTEXT" | sed '2q;d')

	xdotool keyup Control Alt Super

	case $ROFI_RETV in
		1 )
			# username and password
			coproc (
				sleep 0.2
				test "$FIRSTLINE" && {
					echo "$FIRSTLINE" |
						tr -d '\n' |
						xdotool type --file - --delay 20
					xdotool key Tab
				}

				test "$SECONDLINE" && {
					echo "$SECONDLINE" |
						tr -d '\n' |
						xdotool type --file - --delay 20
					#xdotool key Tab
				}
				xdotool key Enter
			)
			;;
		10 )
			# username 
			coproc (
				sleep 0.2
				echo "$FIRSTLINE" |
					tr -d '\n' |
					xdotool type --file - --delay 20
			)
			;;
		11 )
			# password 
			coproc (
				sleep 0.2
				echo "$SECONDLINE" |
					tr -d '\n' |
					xdotool type --file - --delay 20
			)
			;;
		12 )
			# otp code 
			coproc (
				sleep 0.2
				pass otp code "$NAME" |
					tr -d '\n' |
					xdotool type --file - --delay 20
			)
			;;
	esac

fi

