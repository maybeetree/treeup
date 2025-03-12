#!/bin/sh

# idfk what a dbus session is, but without it
# some things will be fucked.
# If this script is running from a dm it might already
# be started, but if not launch it.

if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]
then

	# You'd think these variables need to be `export`ed,
	# but no, that just breaks everything. Eval is correct
	eval "$(dbus-launch --exit-with-x11 --sh-syntax)"

fi

