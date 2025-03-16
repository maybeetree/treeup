#!/bin/bash

xinput map-to-output "$(xinput --list --name-only | dmenu)" "$(xrandr | grep ' connected' | cut -d ' ' -f 1 | dmenu)"

