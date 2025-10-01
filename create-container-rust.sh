#!/bin/sh

set -e

if [ -n "$RUNNING_IN_CONTAINER" ]
then
	cd /treeup
	./packages/packages.void.base.sh
	xbps-install -Syu rustup
	echo | rustup-init

	. $HOME/.cargo/env
	rustup target add wasm32-unknown-unknown

	chsh $(whoami) -s $(which ash)

else

	podman pull ghcr.io/void-linux/void-glibc-busybox  
	podman tag void-glibc-busybox maybetree-treeup-rust

	podman run \
		-t \
		--replace \
		--name 'maybetree-treeup-rust' \
		-v ./:/treeup:ro \
		-e RUNNING_IN_CONTAINER=1 \
		maybetree-treeup-rust \
		/treeup/create-container-rust.sh
	podman commit \
		--change='CMD ["ash", "-l"]' \
		maybetree-treeup-rust maybetree-treeup-rust
fi

