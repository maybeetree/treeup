#!/bin/sh

#killall xdg-desktop-portal

kill_all_xdg_portals.sh || true

#fcitx5 &

#pipewire &
#pipewire-pulse &
#wireplumber &


#polybar &
#alacritty &
#nm-applet &
#mpd --no-daemon &
#xss-lock lock_noblank.sh &
#/usr/libexec/xfce-polkit &
#hhpc -i 15 &

#xmodmap ~/.config/X11/Xmodmap

#bspwm

supervisord -n -c ~/.config/supervisord.conf

#killall xdg-desktop-portal

killall pipewire
killall pipewire-pulse
killall wireplumber
killall supervisord

kill_all_xdg_portals.sh || true

kill $(ps aux | grep '/usr/bin/dbus-daemon' | awk '{print $2}') || true

