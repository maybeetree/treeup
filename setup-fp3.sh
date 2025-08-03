#!/bin/sh

for homedir in \
	profile.d \
	termux-git-annex \
	typos \
	nvim-lite
do
	cp \
		--reflink=auto \
		--recursive \
		--no-target-directory \
		--verbose \
		./homedirs/$homedir ~
done

