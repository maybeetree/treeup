#!/bin/bash

if [ -z "$1" ]; then
	echo "\
(✿◕‿◕)	happy
(=^･ω･^=)	neko
╰( ͡° ͜ʖ ͡° )つ──☆*:・ﾟ	magic
ಠ_ಠ	disapproval
(⁄ ⁄>⁄ ▽ ⁄<⁄ ⁄)	embarassment
┐(￣～￣)┌	indifference
(￢_￢)	suspicion
┬┴┬┴┤( ͡° ͜ʖ├┬┴┬┴	hiding
( ＾▽＾)っ✂╰⋃╯	circumcision
(╯°□°）╯︵ ┻━┻	tableflip
(ノಠ益ಠ)ノ彡┻━┻	tableflip
┬─┬ノ( º _ ºノ)	unflip
(✖╭╮✖)	Deceased
(っ⌒‿⌒)っ	hug
／人◕ ‿‿ ◕人＼	kyubey
（︶︿︶)	sleep
ᗜˬᗜ		fumo
¯\\_(ツ)_/¯	shrug
"
else
	coproc ( echo -n "$1" | cut -f 1 | head -c -1 | pbcopy > /dev/null 2>&1)
fi

