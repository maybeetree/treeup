export PATH=~/bin:$PATH
export RSD_ROOT=~/rsyncdata

# If the shell is a login shell...
#
#  test for normal shells
#   .------------------. 
#  |                   |               test for bash
#  |                   |    .---------------------------------------.
if [ "${0#-}" != "\$0" ] || [ "$0" = "bash" ] && shopt -q login_shell
then
	# Run all the scripts in ~/.profile.login.d
	for script in ~/.profile.login.d/*.sh ; do
		if [ -r "$script" ] ; then
			. "$script"
		fi
	done
	unset script
fi

