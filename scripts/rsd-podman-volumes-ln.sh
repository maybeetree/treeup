#!/bin/sh

appdata="$RSD_ROOT/data/appdata/podman-volumes"
volumesdir=~/.local/share/containers/storage/volumes

if [ ! -d "$appdata" ]
then
	echo "$appdata missing, bye!" > /dev/stderr
	exit 1
fi

if [ ! -d "$volumesdir" ]
then
	echo "$flatpakdir missing, bye!" > /dev/stderr
	exit 1
fi

set -x
for path in $appdata/*
do
	ln -sb $path "$volumesdir"
done
set +x

