#!/bin/sh

set -e

if [ -n "$RUNNING_IN_CONTAINER" ]
then
	cd /treeup
	nix-env -iA \
		`#nixpkgs.lolcat `\
		nixpkgs.busybox \
		nixpkgs.util-linux \
		nixpkgs.trash-cli \
	

	chsh $(whoami) -s $(which ash)

	for homedir in \
		profile.d \
		autovenv
	do
		cp \
			--reflink=auto \
			--recursive \
			--no-target-directory \
			--verbose \
			./homedirs/$homedir ~
	done

	for rootdir in \
		nix-container
	do
		cp \
			--reflink=auto \
			--recursive \
			--no-target-directory \
			--verbose \
			./rootdirs/$rootdir /
	done
else
	#podman pull docker.io/nixos/nix

	#podman container rm maybetree-treeup-nix
	#podman image rm maybetree-treeup-nix

  	#podman tag nix maybetree-treeup-nix

	# podman create nix maybetree-treeup-nix; podman commit maybetree-treeup-nix maybetree-treeup-nix
	podman run \
		-t \
		--replace \
		--name 'maybetree-treeup-nix' \
		-v ./:/treeup:ro \
		-e RUNNING_IN_CONTAINER=1 \
		maybetree-treeup-nix \
		/treeup/setup-container-nix.sh
	podman commit \
		--change='CMD ["ash", "-l"]' \
		maybetree-treeup-nix maybetree-treeup-nix
fi
