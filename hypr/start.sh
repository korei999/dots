#!/bin/sh

killall -q polkit-gnome-authentication-agent-1
killall -q playerctld
killall -q someblocks
killall -q mako

systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
playerctld daemon &
wbg /home/korei/Pictures/wallpapers/carpathians.jpg &
waybar -c $HOME/.config/hypr/waybar/config -s $HOME/.config/hypr/waybar/style.css &
mako &
$HOME/.config/hypr/portals.sh &

corectrl & sleep 2; killall corectrl
