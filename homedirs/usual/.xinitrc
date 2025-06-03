#!/bin/sh

#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#
#

#set -e

#kill_all_xdg_portals.sh || true


#sleep 0.7

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
if [ -z "$XDG_RUNTIME_DIR" ]; then
	XDG_RUNTIME_DIR="/tmp/$(id -u)-runtime-dir"

	mkdir -pm 0700 "$XDG_RUNTIME_DIR"
	export XDG_RUNTIME_DIR
fi

# For fcitx/mozc
#
#export GTK_IM_MODULE=fcitx 
#export XMODIFIERS=@im=fcitx 
#export QT_IM_MODULE=fcitx 
#export XIM_PROGRAM=/usr/bin/fcitx 
#
# For ibus / anthy

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

#export GTK3_MODULES=/usr/local/lib/libplotinus.so 
#gsettings set com.worldwidemann.plotinus:/com/worldwidemann/plotinus/default/ hotkeys '["<Primary><Alt>P"]'

#export QT_STYLE_OVERRIDE=adwaita-dark
export XCURSOR_THEME="Breeze_Snow"

export _JAVA_AWT_WM_NONREPARENTING=1

#export XDG_DATA_DIRS=/usr/share/applications:/home/maybetree/.nix-profile/share:$XDG_DATA_DIRS

xrdb -merge ~/.config/X11/Xresources

xsetroot -cursor_name left_ptr

#synclient HorizTwoFingerScroll=1

#exec dbus-launch launch_de.sh
#eval "$(dbus-launch --exit-with-x11 --sh-syntax)"

for script in ~/.config/X11/xinitrc.d/*.sh ; do
	if [ -r "$script" ] ; then
		. "$script"
	fi
done
unset script

runsvdir ~/.var/service

#polybar &
#sxhkd &
#ibus-daemon &
#pipewire &
#pipewire-pulse &
#wireplumber &
#bsphud &
#redshift -l "$WHEREAMI" &
$bspwm



