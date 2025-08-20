export PATH=~/bin:$PATH
export RSD_ROOT=~/rsyncdata

# If the shell is a login shell...
#if [ "${0#-}" != "\$0" ]
#then
case "$-"
	in *i* )
		# Run all the scripts in ~/.profile.login.d
		for script in ~/.profile.login.d/*.sh ; do
			if [ -r "$script" ] ; then
				. "$script"
			fi
		done
		unset script
		;;
esac
#fi

