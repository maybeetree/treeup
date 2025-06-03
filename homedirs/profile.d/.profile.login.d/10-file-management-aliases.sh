alias l="ls -a --color"
alias ll="ls -lah --color"
alias c="cp -r --reflink=always -i"
alias r="trash -v"
alias m="mv -i"
alias o="handlr open"
alias mkd="mkdir -p"
alias ,,="d .."
alias ,,,="d ../.."
alias ,,,,="d ../../.."
alias ,,,,,="d ../../../.."
alias ,,,,,,="d ../../../../.."
alias ,,,,,,,="d ../../../../../.."

d() {
	cd "$@" && l
}

rln() {
	if [ -z "$1" ] || [ -z "$2" ]
	then
		echo "Usage: rln <source> <dest>" > /dev/stderr
		return 1
	fi
	ln -sf "$(realpath "$1")" "$2"
}

space() {
	if [ -r /usr/share/dict/words ]
	then
		local name="$(shuf /usr/share/dict/words | grep -Pvm 3 '[^a-z]' | tr '\n' '-' | head -c -1)"
	else
		local name=$(date +"%Y-%m-%dT%H:%M:%S%z")
		echo "/usr/share/dict/words not found" 1>&2
	fi
	mkdir -p ~/tmp/$name
	cd ~/tmp/$name
}

