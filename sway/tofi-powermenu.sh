#!/bin/bash

entries="⇠ Logout\n⏾ Suspend\n⭮ Reboot\n⏻ Shutdown"

selected=$(echo -e $entries| tofi | awk '{print tolower($2)}')

case $selected in
    logout)   
        exec swaymsg exit
        ;;
    suspend)
        exec systemctl suspend
        ;;
    reboot)
        exec systemctl reboot
        ;;
    shutdown)
        exec systemctl poweroff -i
        ;;
esac
