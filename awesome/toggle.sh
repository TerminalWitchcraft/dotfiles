#!/bin/bash

if pgrep compton &>/dev/null; then
    notify-send "Turning compton OFF"
    pkill compton
else
    notify-send "Turning compton ON"
    compton -b
fi

exit 0
