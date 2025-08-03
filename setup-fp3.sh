#!/bin/sh

for homedir in \
	profile.d \
	nvim-lite
do
	cp \
		--reflink=auto \
		--recursive \
		--no-target-directory \
		--verbose \
		./homedirs/$homedir ~
done

