#!/bin/sh

for homedir in alpine.base force-busybox
do
	cp \
		--reflink=auto \
		--recursive \
		--no-target-directory \
		--verbose \
		./homedirs/$homedir ~
done

