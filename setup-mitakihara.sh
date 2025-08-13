#!/bin/sh

for homedir in \
	tmux \
	profile.d \
	prompt \
	nvim-lite \
	fastfetch-on-ssh-login \
	bashrc-is-profile \
	sudo-doas
do
	cp \
		--reflink=auto \
		--recursive \
		--no-target-directory \
		--verbose \
		./homedirs/$homedir ~
done

