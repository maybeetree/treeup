#!/bin/sh

apk add \
	jq \
	tmux \
	trash-cli \
	shadow \
	util-linux \
	words
apk add -X 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' \
	lolcat \
	pfetch


