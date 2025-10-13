#!/bin/sh

set -x

for f in /sys/bus/usb/devices/*/power/wakeup
do
	echo disabled > $f
done

cat /sys/bus/usb/devices/*/power/wakeup

