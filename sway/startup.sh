killall -q waybar
killall -q mako

# blueman-applet &
mako &
waybar &
corectrl & sleep 2; killall corectrl
