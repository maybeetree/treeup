#!/bin/sh

set -e

if [ -n "$RUNNING_IN_CONTAINER" ]
then
	cd /treeup
	./packages/packages.alpine.base.sh

	chsh $(whoami) -s $(which ash)

else
	podman run \
		-t \
		--replace \
		--name 'maybetree-treeup-alpine' \
		-v ./:/treeup:ro \
		-e RUNNING_IN_CONTAINER=1 \
		maybetree-treeup-alpine \
		/treeup/create-container-alpine.sh
	podman commit \
		--change='CMD ["ash", "-l"]' \
		maybetree-treeup-alpine maybetree-treeup-alpine
fi

