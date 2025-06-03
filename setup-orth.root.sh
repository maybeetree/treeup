#!/bin/sh

set -e

for rootdir in \
	thinkpad-t420 \
	sudoers \
	xinitrc-from-display-manager \
	media \
	keyd \
	alsa-pipewire \
	runit-rshared-root \
	nano-is-nvim \
	tpacpi-bat \
	lightdm-wallpaper-orth \
	elogind-suspend-then-hibernate
do
	sudo cp \
		--reflink=auto \
		--recursive \
		--no-target-directory \
		--verbose \
		./rootdirs/$rootdir /
done

