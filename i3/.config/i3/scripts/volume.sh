#!/bin/bash

mute() {
    i3-volume mute
}

get_volume() {
    if amixer get Master | grep -q '\[off\]'; then
        echo "Muted"
        return
    fi
    amixer get Master | awk -F'[][]' '/%/ { print $2 }' | head -n1;
}

toggle_pavucontrol() {
    if pgrep -x "pavucontrol-qt" > /dev/null; then
        pkill -x "pavucontrol-qt"
    else
        i3-msg -q "exec --no-startup-id pavucontrol-qt"
    fi
}

case $BLOCK_BUTTON in
    1) mute ;;  # Left click, mute
    3) toggle_pavucontrol ;;  # Right click, open pavucontrol
    4) i3-volume up 5;;
    5) i3-volume down 5;;
esac

get_volume

