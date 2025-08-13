exitstatus() {
	STAT=$?
	[ $STAT = 0 ] && echo -ne "\e[32m" || echo -ne "\e[31m"
	echo -n [$STAT]
}

termwidth() {
	stty size
}

#PS1='\n\e[1m$(exitstatus) \e[36m\u\033[m @ \e[1;32m\H\033[m: $(echo "\w"|tail -c $(expr $(termwidth | cut -d" " -f2) - 24)|lolcat -l -f -h 0.2 |tr -d "\n")\n\[\033[1;31m\]>\[\033[1;31m\]>\[\033[1;31m\]> \[\033[0m\]'

#PS1='\n\e[1m$(exitstatus) \e[36m\u\033[m @ \e[1;32m\H\033[m: $(echo "\w"|lolcat -l -f -h 0.2 |tr -d "\n")\n\[\033[1;31m\]>\[\033[1;31m\]>\[\033[1;31m\]> \[\033[0m\]'

#PS1='\n\e[1m$(exitstatus) \e[36m\u\033[m @ \e[1;32m\H\033[m: $(echo "\w"|lolcat -l -f -h 0.3 |tr -d "\n")\n\[\033[1;96m\]>>> \[\033[0m\]'

#PS1='\n\e[1m$(exitstatus) \e[36m\u\033[m @ \e[1;32m\H\033[m: $(pwd | sed "s|^/home/$(id -un)|~|" | lolcat -f -h 0.2)\[\033[1;96m\]>>> \[\033[0m\]'

if ! (lolcat --version > /dev/null 2>&1 )
then
	lolcat_cmd=''
	extra_newline="\n"
elif lolcat --version | grep 'jaseg' &>/dev/null
then
	lolcat_cmd='| lolcat -f -h 0.2'
else
	lolcat_cmd='| lolcat -f -F 0.2'
	extra_newline="\n"
fi

# This is not a standard env variable or anything.
# I'm setting it in the ./setup-container-* scripts
if [ -n "$RUNNING_IN_CONTAINER" ]
then
	# Red
	prompt_style='\033[1;31m'
else
	# Bright cyan
	prompt_style='\033[1;96m'
fi

case "$0" in
	ash)
		PS1='\[\n\e[1m$(exitstatus) \e[36m\u\033[m @ \e[1;32m\H\033[m: $(pwd | sed "s|^/home/$(id -un)|~|" '"$lolcat_cmd"')'"$extra_newline$prompt_style"'\]>>> \[\033[0m\]'
		;;
	bash)
		PS1='\n\e[1m$(exitstatus) \e[36m\u\033[m @ \e[1;32m\H\033[m: $(echo "\w"|tail -c $(expr $(tput cols) - 24)|'"$lolcat_cmd"' |tr -d "\n")\n'"$extra_newline"'>>> \[\033[0m\]'
		;;
	*)
		echo "Weird shell, not setting prompt" > /dev/stderr
		;;
esac
	

unset lolcat_cmd
unset extra_newline
unset prompt_style



