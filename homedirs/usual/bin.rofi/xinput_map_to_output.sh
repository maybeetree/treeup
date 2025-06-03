#!/bin/bash

xinput map-to-output "$(xinput --list --name-only | dmenu -l 100)" "$(xrandr | grep ' connected' | cut -d ' ' -f 1 | dmenu -l 100)"

