alias l="ls -a --color"
alias ll="ls -lah --color"
alias c="cp -r --reflink=always -i"
alias r="trash -v"
alias m="mv -i"
alias o="handlr open"
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

