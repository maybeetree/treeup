#!/bin/sh

cd ~/.config/alacritty

if [ "$(alacritty --version | cut -d. -f2)" -gt 12 ]
then
	sed -i 's/dark/AAAAAA/;s/light/dark/;s/AAAAAA/light/' ./colors-switch.toml 
	touch ./alacritty.toml 
else
	if [ $(realpath ./alacritty-light.yml) = $(realpath ./alacritty.yml) ]
	then
		ln -sf ./alacritty-dark.yml ./alacritty.yml
	else
		ln -sf ./alacritty-light.yml ./alacritty.yml
	fi
fi

