#!/bin/sh

for rootdir in thinkpad-t420
do
	sudo cp \
		--reflink=auto \
		--recursive \
		--no-target-directory \
		--verbose \
		./rootdirs/$rootdir /
done

