
if [ -n "$SSH_CONNECTION" ] &&  [ -z "$SSH_LOGIN_FETCH" ]; then
	(pfetch || pfetch-rs || fastfetch || neofetch || screenfetch) 2>/dev/null
	export SSH_LOGIN_FETCH="done"
fi

