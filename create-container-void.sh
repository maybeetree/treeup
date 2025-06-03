#!/bin/sh

set -e

if [ -n "$RUNNING_IN_CONTAINER" ]
then
	cd /treeup
	./packages/packages.void.base.sh
	xbps-install -Syu xorg

	chsh $(whoami) -s $(which ash)

else
	#podman pull docker.io/nixos/nix

	#podman container rm maybetree-treeup-nix
	#podman image rm maybetree-treeup-nix

  	#podman tag nix maybetree-treeup-nix

	# podman create nix maybetree-treeup-nix; podman commit maybetree-treeup-nix maybetree-treeup-nix

	podman pull ghcr.io/void-linux/void-glibc-busybox  
	podman tag void-glibc-busybox maybetree-treeup-void

	podman run \
		-t \
		--replace \
		--name 'maybetree-treeup-void' \
		-v ./:/treeup:ro \
		-e RUNNING_IN_CONTAINER=1 \
		maybetree-treeup-void \
		/treeup/create-container-void.sh
	podman commit \
		--change='CMD ["ash", "-l"]' \
		maybetree-treeup-void maybetree-treeup-void
fi

