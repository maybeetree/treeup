#!/bin/sh

for rootdir in \
	xinitrc-from-display-manager \
	force-evdev \
	mistilteinn-misc \
	keyd \
	alsa-pipewire
do
	doas cp \
		--reflink=auto \
		--recursive \
		--no-target-directory \
		--verbose \
		./rootdirs/$rootdir /
done

