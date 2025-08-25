#!/bin/sh


if [ "$(hostname)" != mistilteinn ]
then
	echo "Not mistilteinn! are u sure?"
	read n
fi

for homedir in \
	profile.d \
	prompt \
	tmux \
	usual \
	fcitx-anthy \
	xclip-helpers \
	dragon-drop \
	nvim-lite \
	mistilteinn-screen-layout \
	scrotsh \
	alacritty \
	mistilteinn-tablet \
	w3m \
	git \
	mpd \
	git-gpg-tty-fix \
	sudo-doas
do
	cp \
		--reflink=auto \
		--recursive \
		--no-target-directory \
		--verbose \
		./homedirs/$homedir ~
done

