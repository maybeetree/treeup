exitstatus() {
	STAT=$?
	[[ $STAT == 0 ]] && echo -ne "\e[32m" || echo -ne "\e[31m"
	echo -n [$STAT]
}

termwidth() {
	stty size
}

#PS1='\n\e[1m$(exitstatus) \e[36m\u\033[m @ \e[1;32m\H\033[m: $(echo "\w"|tail -c $(expr $(termwidth | cut -d" " -f2) - 24)|lolcat -l -f -h 0.2 |tr -d "\n")\n\[\033[1;31m\]>\[\033[1;31m\]>\[\033[1;31m\]> \[\033[0m\]'

#PS1='\n\e[1m$(exitstatus) \e[36m\u\033[m @ \e[1;32m\H\033[m: $(echo "\w"|lolcat -l -f -h 0.2 |tr -d "\n")\n\[\033[1;31m\]>\[\033[1;31m\]>\[\033[1;31m\]> \[\033[0m\]'

#PS1='\n\e[1m$(exitstatus) \e[36m\u\033[m @ \e[1;32m\H\033[m: $(echo "\w"|lolcat -l -f -h 0.3 |tr -d "\n")\n\[\033[1;96m\]>>> \[\033[0m\]'

PS1='\n\e[1m$(exitstatus) \e[36m\u\033[m @ \e[1;32m\H\033[m: $(pwd | sed "s|^/home/$(id -un)|~|" | lolcat -f -h 0.2)\[\033[1;96m\]>>> \[\033[0m\]'



