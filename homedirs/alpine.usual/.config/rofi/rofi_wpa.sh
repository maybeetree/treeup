#!/bin/bash

echo -en "\0use-hot-keys\x1ftrue\n"
#echo -en "\0no-custom\x1ftrue\n"

function format_nets {
	while read line
	do
		echo "$line" | awk -F'\t' '{print $5}'
	done
}

case "$ROFI_RETV" in
	0 )
		wpa_cli scan > /dev/null
		wpa_cli scan_results | format_nets
		;;
	1 )
		notify-send "$1"
		;;
	* )
		wpa_cli scan_results | format_nets
		;;
esac

