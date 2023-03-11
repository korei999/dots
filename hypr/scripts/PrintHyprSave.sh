#!/bin/sh

grim -o $(hyprctl -j monitors | jq -r '.[] | select(.focused) | .name') \
	$HOME/Pictures/Screens/$(date +'%Y-%m-%d-%H:%M:%S-screenshot.png')
sleep 0.1
notify-send "Saved" "to ~/Pictures/Screens/" -t 2000
