#!/bin/sh

MONS=$(find ~/proj/pictures-i-like/wallpapers -type f -not -path '*xfce*' -not -name '*.webp' | shuf)
j=1

for i in $(xrandr | grep " connected" | cut -d' ' -f 1)
do
        echo --output $i --zoom $(echo $MONS | cut -d' ' -f $j)
        j=$(expr $j + 1)
done | xargs xwallpaper

