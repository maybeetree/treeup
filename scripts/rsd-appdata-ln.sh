#!/bin/sh
#
# Scan $RSD_ROOT/data/appdata/*-flatpak/*.*.* and make symlinks in
# ~/.var/app/

appdata="$RSD_ROOT/data/appdata"
flatpakdir=~/.var/app

if [ ! -d "$appdata" ]
then
	echo "$appdata missing, bye!" > /dev/stderr
	exit 1
fi

if [ ! -d "$flatpakdir" ]
then
	echo "$flatpakdir missing, bye!" > /dev/stderr
	exit 1
fi

set -x
for path in $appdata/*-flatpak/*.*.*
do
	ln -sb $path "$flatpakdir"
done
set +x

