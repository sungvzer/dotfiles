#!/bin/bash

mute() {
    amixer set Master toggle > /dev/null
}

get_volume() {
    if amixer get Master | grep -q '\[off\]'; then
        echo "Muted"
        return
    fi
    amixer get Master | awk -F'[][]' '/%/ { print $2 }' | head -n1;
}

case $BLOCK_BUTTON in
    1) mute ;;  # Left click, mute
    3) i3-msg -q "exec --no-startup-id pavucontrol-qt" ;;  # Right click, open pavucontrol
    4) amixer set Master 5%+ > /dev/null ; get_volume ;;  # Scroll up
    5) amixer set Master 5%- > /dev/null ; get_volume ;;  # Scroll down
esac

get_volume

