killall -q mpris-proxy
killall -q polkit-gnome-authentication-agent-1
killall -q autotiling

xrandr --output DisplayPort-0 --mode 1920x1080 --rate 240 
# setxkbmap -layout us,ua &
/home/korei/.config/i3/polybar/launch.sh &
# nvidia-settings --load-config-only &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# nm-applet &
# blueman-applet &
picom &
autotiling &
mpris-proxy &
/usr/bin/dunst &
unclutter &
xwallpaper --output DisplayPort-0  --zoom /home/korei/Pictures/wallpapers/carpathians.jpg &
corectrl & sleep 2; killall corectrl
