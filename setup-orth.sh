#!/bin/sh

for homedir in \
	tmux \
	profile.d \
	alacritty \
	nvim-lite \
	usual \
	fcitx-mozc \
	sudo-doas \
	xclip-helpers \
	dragon-drop \
	ssh \
	locate-paranoia \
	scrotsh \
	i3lock \
	git \
	synclient-horiz-two-finger-scroll \
	w3m \
	loginctl-rofi
do
	cp \
		--reflink=auto \
		--recursive \
		--no-target-directory \
		--verbose \
		./homedirs/$homedir ~
done

