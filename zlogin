# If running from tty1 start sway
# [ "$(tty)" = "/dev/tty1" ] && exec /home/korei/sway.sh
[ "$(tty)" = "/dev/tty1" ] && exec /home/korei/dwl.sh
# [ "$(tty)" = "/dev/tty1" ] && exec startx
