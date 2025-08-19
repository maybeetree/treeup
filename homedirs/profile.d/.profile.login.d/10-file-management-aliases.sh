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

#d() {
#	cd "$@" && l
#}

d() {
	# Path passed to cd
	local target="$1"

	# If no argument, default to $HOME
	if [ -z "$target" ]; then
		cd ~
		return
	fi

	# Resolve full path
	local fullpath=$(readlink -f "$target" 2>/dev/null)

	# If it's a .zip file and exists
	if [ -f "$fullpath" ]
	then
		case "$target" in
			*.zip | *.tar)
				if ! mount | grep -q ~/.avfs; then
					echo "AVFS not mounted. Run: mountavfs"
					return 1
				fi

				# Generate AVFS path
				local avfs_path="$HOME/.avfs$fullpath#"

				if [ -d "$avfs_path" ]; then
					cd "$avfs_path" && l
				else
					echo "AVFS path not found: $avfs_path"
					return 1
				fi
				;;
			*)
				cd "$target" && l
				;;
		esac
	else
		# Fallback to normal cd
		cd "$target" && l
	fi
}

avcd() {
	case "$(pwd)" in
		/home/*/.avfs*)
			cd  "$(pwd | sed 's|^.*.avfs/|/|')"
			;;
		*)
			cd ~/.avfs"$(pwd)"
			;;
	esac

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
		# Void
		wordfile=/usr/share/dict/words
	elif [ -r /usr/share/dict/british  ]
	then
		# Alpine
		wordfile=/usr/share/dict/british
	elif [ -r /usr/share/dict/usa  ]
	then
		# Alpine
		wordfile=/usr/share/dict/usa
	else
		wordfile=""
		echo "wordfile not found" 1>&2
	fi

	if [ -n "$wordfile" ]
	then
		local name="$(shuf "$wordfile" | grep -vm 3 '[^a-z]' | tr '\n' '-' | head -c -1)"
	else
		local name=$(date +"%Y-%m-%dT%H:%M:%S%z")
	fi

	mkdir -p ~/tmp/$name
	cd ~/tmp/$name
}

