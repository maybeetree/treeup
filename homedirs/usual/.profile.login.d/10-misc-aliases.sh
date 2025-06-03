alias docx2pdf='flatpak run org.libreoffice.LibreOffice --headless --print-to-file'
alias yp="history -w /dev/stdout | tail -n 2 | head -n 1 | pbcopy"
alias pe="source venv/bin/activate"

alias rsv="SVDIR=~/.var/service vsv"
alias rrsv="SVDIR=~/.var/service sv"

alias pod-pwd='podman run --rm -ti --mount type=bind,src="$PWD",dst=/pwd,rw '
alias pod-pwd-xorg='podman run -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/.Xauthority:/root/.Xauthority:Z --net=host --rm -ti --mount type=bind,src="$PWD",dst=/pwd,rw '

quarter() {
	year=$(date +%Y)
	month=$(date +%m)

	# Remove leading zero to avoid arithmetic errors
	month=$((10#$month))

	# Calculate the quarter
	if [ "$month" -le 3 ]; then
		quarter=1
	elif [ "$month" -le 6 ]; then
		quarter=2
	elif [ "$month" -le 9 ]; then
		quarter=3
	else
		quarter=4
	fi

	echo "Year: $year, Quarter: Q$quarter"

	unset year
	unset month
	unset quarter
}
