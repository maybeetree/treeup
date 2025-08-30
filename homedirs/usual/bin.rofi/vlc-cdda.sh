#!/bin/sh

if flatpak info org.videolan.VLC
then
	flatpak run org.videolan.VLC --qt-start-minimized cdda://
else
	vlc --qt-start-minimized cdda://
fi

