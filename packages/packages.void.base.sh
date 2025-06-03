#!/bin/sh

xbps-install -Syu \
	busybox-huge `# for ash, my favourite shell` \
	jq \
	tmux \
	trash-cli \
	lolcat-c \
	neovim \
	fzf \
	psmisc \
	rsync \
	terminus-font `# nice as a console font ` \
	xtools \
	fastfetch \
	pfetch \
	shadow `# basic stuff like useradd ` \
	util-linux `# chsh` \
	words-en


