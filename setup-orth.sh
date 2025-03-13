#!/bin/sh

for homedir in alacritty nvim-lite
do
	cp \
		--reflink=auto \
		--recursive \
		--no-target-directory \
		--verbose \
		./homedirs/$homedir ~
done

