
if [ -n "$SSH_CONNECTION" ]; then
	(pfetch || pfetch-rs || fastfetch || neofetch || screenfetch) 2>/dev/null
fi

