#!/bin/sh

xbps-install -Syu \
	polybar \
	bspwm \
	sxhkd \
	rofi \
	dunst \
	xsetroot \
	alacritty \
	nsxiv \
	zathura \
	zathura-cb \
	zathura-djvu \
	zathura-pdf-mupdf \
	zathura-ps \
	tdrop \
	NetworkManager \
	network-manager-applet \
	breeze-snow-cursor-theme \
	xorg \
	xclip \
	handlr \
	fastfetch \
	font-Siji `# for polybar` \
	`#lightdm` \
	`#light-locker` \
	i3lock \
	xss-lock
	mpv \
	dragon \
	scrot \
	\
	`# Next is flatpak stuff ` \
	xdg-user-dirs \
	xdg-user-dirs-gtk \
	xdg-utils \
	flatpak \
	libportal `# TODO needed? `\
	libportal-gtk3 `# TODO needed? `\
	xdg-desktop-portal \
	xdg-desktop-portal-gtk \
	xwallpaper \
	xbanish \
	\
	`# Now for the sound stuff` \
	alsa-pipewire \
	pipewire \
	wireplumber \
	\
	`# hardware stuff ` \
	tpacpi-bat \
	\
	`# Fcitx/mozc` \
	mozc \
	fcitx5 \
	fcitx5-mozc \
	fcitx5-gtk \
	fcitx5-gtk+2 \
	fcitx5-gtk+3 \
	fcitx5-gtk4 \
	`# fpr putfile (partprobe)` \
	parted \
	


