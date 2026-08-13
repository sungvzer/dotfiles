#!/bin/bash

get_volume() {
    if amixer get Master | grep -q '\[off\]'; then
        echo "Muted"
        return
    fi
    amixer get Master | awk -F'[][]' '/%/ { print $2 }' | head -n1
}

mute() {
    i3-volume mute
}

toggle_pavucontrol() {
    if pgrep -x "pavucontrol-qt" >/dev/null; then
        pkill -x "pavucontrol-qt"
    else
        i3-msg -q "exec --no-startup-id pavucontrol-qt"
    fi
}

should_notify() {
    button=$1
    case $button in
    1 | 4 | 5) return 0 ;; # Scroll events, do not notify
    *) return 1 ;;         # Other events, notify
    esac
}

volume_up() {
    # Check if volume is 100%. If it is, do not increase further
    current_volume=$(get_volume)
    if [ "$current_volume" != "Muted" ] && [ "${current_volume%\%}" -ge 100 ]; then
        return
    fi
    i3-volume up 5
}

volume_down() {
    # Check if volume is 0%. If it is, do not decrease further
    current_volume=$(get_volume)
    if [ "$current_volume" != "Muted" ] && [ "${current_volume%\%}" -le 0 ]; then
        return
    fi
    i3-volume down 5
}

case $BLOCK_BUTTON in
1) mute ;;               # Left click, mute
3) toggle_pavucontrol ;; # Right click, open pavucontrol
# Scroll up, launch volume script in background
4) volume_up ;;
5) volume_down ;;
esac

if should_notify $BLOCK_BUTTON; then
    i3-msg "exec --no-startup-id $HOME/.config/i3/scripts/volume_script.sh notify" >/dev/null
fi

"$HOME/.config/i3/scripts/volume_script.sh"
