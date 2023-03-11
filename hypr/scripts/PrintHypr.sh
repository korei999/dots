#!/bin/sh

\rm -r /tmp/wl-copy-buffer*

grim -o $(hyprctl -j monitors | jq -r '.[] | select(.focused) | .name') - | wl-copy
sleep 0.1
notify-send -i /tmp/wl-copy*/* "Saved" "to \nclipboard" -t 2000
