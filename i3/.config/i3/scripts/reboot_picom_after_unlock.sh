#!/bin/sh

gdbus monitor -y -d org.freedesktop.login1 |\
    grep --line-buffered -i 'unlock ()' |\
    while read -r line; do
        if [ -n "$line" ]; then
            # Restart picom after unlocking
            killall picom
            picom -b
        fi
    done
