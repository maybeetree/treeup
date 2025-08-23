#!/bin/sh

# -not -d instead of -f is because they are all symlinks when managed by
# git-annex
MONS=$(find ~/proj/pictures-i-like/wallpapers -not -type d -not -path '*xfce*' -not -name '*.webp' | shuf)
j=1

for i in $(xrandr | grep " connected" | cut -d' ' -f 1)
do
        echo --output $i --zoom $(echo $MONS | cut -d' ' -f $j)
        j=$(expr $j + 1)
done | xargs xwallpaper

