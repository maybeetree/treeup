#!/bin/sh

cp \
	--reflink=auto \
	--recursive \
	--no-target-directory \
	--verbose \
	"$1" "$2"

