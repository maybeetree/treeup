#!/bin/sh

for homedir in alpine.base alpine.usual force-busybox xclip-helpers dragon-drop nvim-lite mistilteinn-screen-layout alacritty
do
	cp \
		--reflink=auto \
		--recursive \
		--no-target-directory \
		--verbose \
		./homedirs/$homedir ~
done

