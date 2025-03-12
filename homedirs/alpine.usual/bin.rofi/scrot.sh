#!/bin/sh

if [ -z "$SCROTSH_DIR" ]
then
	SCROTSH_DIR=/tmp/scrots
fi

mkdir -p "$SCROTSH_DIR"
cd "$SCROTSH_DIR"

#file=$(scrot -s -e 'avif="$$(echo "$f" | sed s/\.png/\.avif/)"; avifenc -j all "$f" "$$avif"; echo "$$avif"' | tail -n 1)
#cat "$file" | xclip -selection clipboard -i -t image/avif

file=$(scrot -s -e 'echo $f')
#cat "$file" | xclip -selection clipboard -i -t image/png
xclip -selection clipboard -target image/png -i "$file"

