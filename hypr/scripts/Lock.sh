#!/bin/bash

LOCK_BG="/home/korei/Pictures/wallpapers/SetupLenovo.png"
LOCK="swaylock -f -c 121212 -i $LOCK_BG -s fill --font Spleen --font-size 24 --indicator-radius 90 --indicator-thickness 15"
LOCK_EFF="swaylock --font Spleen --font-size 24 --screenshots --indicator-radius 100 --indicator-thickness 9 --effect-blur 7x5 --effect-vignette 0.5:0.5 --fade-in 0.2"

def() {
	swayidle -w \
		# timeout 600 "playerctl -a pause & $LOCK"\
		timeout 600 "hyprctl dispatch dpms off"\
		resume "hyprctl dispatch dpms on"\
		timeout 1200 "sudo systemctl suspend"\
		before-sleep "$LOCK"
}

lock() {
	$LOCK
}

case "$1" in
  lock) lock;;
  *) def;;
esac
