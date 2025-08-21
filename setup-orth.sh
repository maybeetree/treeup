#!/bin/sh

for homedir in \
	tmux \
	profile.d \
	prompt \
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
	mpd \
	git-gpg-tty-fix \
	loginctl-rofi
do
	cp \
		--reflink=auto \
		--recursive \
		--no-target-directory \
		--verbose \
		./homedirs/$homedir ~
done

