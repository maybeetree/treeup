#!/bin/sh

if [ -z "$DISPLAY" ]; then
	echo "Uayyyyy!!!"
	exit 1
fi

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Should be initialized somehow else but idk
#if [ -z "$XDG_RUNTIME_DIR" ]; then
#	XDG_RUNTIME_DIR="/tmp/$(id -u)-runtime-dir"
#
#	mkdir -pm 0700 "$XDG_RUNTIME_DIR"
#	export XDG_RUNTIME_DIR
#fi


#export QT_STYLE_OVERRIDE=adwaita-dark
export XCURSOR_THEME="Breeze_Snow"

export _JAVA_AWT_WM_NONREPARENTING=1

#export XDG_DATA_DIRS=/usr/share/applications:/home/maybetree/.nix-profile/share:$XDG_DATA_DIRS

xrdb -merge ~/.config/X11/Xresources

xsetroot -cursor_name left_ptr

for script in ~/.config/X11/xinitrc.d/*.sh ; do
	if [ -r "$script" ] ; then
		. "$script"
	fi
done
unset script

runsvdir ~/.var/service


