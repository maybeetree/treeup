#!/bin/sh

if [ "$(id -u)" -eq 0 ]
then
	echo "Run as user u want to give xorg perms to" > /dev/stderr
	exit 1
fi

doas addgroup "$(whoami)" input
doas addgroup "$(whoami)" video

