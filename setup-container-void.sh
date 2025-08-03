#!/bin/sh

if [ -n "$1" ]
then
	name="$1"
else
	name=maybetree-treeup-void
fi

set -e

if [ -n "$RUNNING_IN_CONTAINER" ]
then
	cd /treeup

	for homedir in \
		profile.d \
		prompt \
		autovenv \
		nvim-lite \
		fastfetch-on-login
	do
		cp \
			--reflink=auto \
			--recursive \
			--no-target-directory \
			--verbose \
			./homedirs/$homedir ~
	done

	#for rootdir in \
	#	nix-container
	#do
	#	cp \
	#		--reflink=auto \
	#		--recursive \
	#		--no-target-directory \
	#		--verbose \
	#		./rootdirs/$rootdir /
	#done
else
	podman run \
		-t \
		--replace \
		--name "$name" \
		-v ./:/treeup:ro \
		-e RUNNING_IN_CONTAINER=1 \
		"$name" \
		/treeup/setup-container-void.sh
	podman commit \
		--change='CMD ["ash", "-l"]' \
		"$name" "$name"
fi

