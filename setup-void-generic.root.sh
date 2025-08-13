#!/bin/sh

set -e

for rootdir in \
	sudoers \
	media \
	runit-rshared-root \
do
	sudo cp \
		--reflink=auto \
		--recursive \
		--no-target-directory \
		--verbose \
		./rootdirs/$rootdir /
done

