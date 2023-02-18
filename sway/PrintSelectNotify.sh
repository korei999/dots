#!/bin/sh

grim -g "$(slurp -d)" - | wl-copy
sleep 0.1
notify-send -i /tmp/wl-copy*/* "Saved" "to \nclipboard" -t 2000
