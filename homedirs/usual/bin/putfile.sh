#!/bin/sh

set -e

if ! command -v doas
then
	alias doas=sudo
fi

if [ ! -b "$1" ]
then
	echo "$1: not a block device"
	exit 1
fi

#if [ ! -f "$2" ] && [ ! -h "$2" ] && [ ! -d "$2" ]
#then
#	echo "$2: not a file or directory"
#	exit 1
#fi

disk=$1
src=$2

mkdir -p ~/media/putfile

doas echo

doas umount ~/media/putfile || true
rm -rf ~/media/putfile
mkdir ~/media/putfile

doas dd if=/dev/zero of="$disk" bs=1024 count=1
doas wipefs --all "$disk"
doas partprobe
echo -e 'o\nn\np\n1\n\n\nw' | doas fdisk "$disk"


part=$disk*1

doas mkfs.vfat $part
uid=$(id -u "$USER")
gid=$(id -g "$USER")

if [ -f "$2" ] || [ -h "$2" ] || [ -d "$2" ]
then
	doas mount $part ~/media/putfile/ -o uid=$uid,gid=$gid
	cp -r "$src" ~/media/putfile
	sync
	doas umount ~/media/putfile
fi

echo "Done!"

