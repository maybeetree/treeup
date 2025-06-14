#!/bin/sh


if [ "$(hostname)" != mistilteinn ]
then
	echo "Not mistilteinn! are u sure?"
	read n
fi

for homedir in \
	profile.d \
	tmux \
	usual \
	ibus-anthy \
	xclip-helpers \
	dragon-drop \
	nvim-lite \
	mistilteinn-screen-layout \
	scrotsh \
	alacritty \
	mistilteinn-tablet \
	w3m \
	git \
	sudo-doas
do
	cp \
		--reflink=auto \
		--recursive \
		--no-target-directory \
		--verbose \
		./homedirs/$homedir ~
done

