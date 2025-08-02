#!/bin/sh

set -e

if [ -n "$RUNNING_IN_CONTAINER" ]
then
	cd /treeup

	mkdir -p ~/.profile.login.d
	
	if [ -f ~/.profile ]
	then
		mv ~/.profile ~/.profile.login.d/10-profile-local.sh
	fi

	for homedir in \
		profile.d \
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

	if [ -n "$1" ]
	then
		name="$1"
	else
		echo "Specify name!"
		exit 69
	fi

	podman run \
		-t \
		--replace \
		--name "$name" \
		-v ./:/treeup:ro \
		-e RUNNING_IN_CONTAINER=1 \
		"$name" \
		/treeup/setup-container-generic.sh
	podman commit \
		`#--change='CMD ["/bin/sh", "-l"]' `\
		--change='CMD' \
		"$name" "$name"
fi

