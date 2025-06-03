if [ -d ./venv ]
then
	. ./venv/bin/activate
else
	if [ -d ~/venv ]
	then
		. ~/venv/bin/activate
	else
		if [ -d /venv ]
		then
			. /venv/bin/activate
		fi
	fi
fi

