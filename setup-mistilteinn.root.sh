#!/bin/sh

for rootdir in xinitrc-from-display-manager
do
	doas cp \
		--reflink=auto \
		--recursive \
		--no-target-directory \
		--verbose \
		./rootdirs/$rootdir /
done

