if command -v doas > /dev/null
then
	alias sudo=doas
elif command -v sudo > /dev/null
then
	alias doas=sudo
else
	echo "Neither sudo no doas found" > /dev/stderr
fi

