#!/bin/sh

grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') - | wl-copy
sleep 0.1
notify-send -i /tmp/wl-copy*/* "Saved" "to \nclipboard" -t 2000
