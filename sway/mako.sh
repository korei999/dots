#!/bin/sh

if [ "$(makoctl mode)" = default ]
then
    makoctl set-mode dnd
else
    makoctl set-mode default
    notify-send "mako" "is set to default"
fi

