#!/bin/sh

set -e

for rootdir in \
	sudoers \
	no-usb-wakeup \
	runit-rshared-root
do
	cp \
		--reflink=auto \
		--recursive \
		--no-target-directory \
		--verbose \
		./rootdirs/$rootdir /
done

