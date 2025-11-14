DEBOUNCE_PERIOD=0.4

play_sound() {
    bubble_pop_sound="$HOME/.config/i3/sounds/bubblepop.mp3"
    paplay "$bubble_pop_sound" &> /dev/null &
}

notify_volume() {
    bubble_pop_sound="$HOME/.config/i3/sounds/bubblepop.mp3"
    volume=$(get_volume)

    if [ -f /tmp/volume_notify_lock ]; then
        pid=$(cat /tmp/volume_notify_lock)
        if ps -p $pid > /dev/null 2>&1; then
            rm /tmp/volume_notify_lock
            kill $pid
        fi
    fi
    ( sleep $DEBOUNCE_PERIOD; play_sound; rm /tmp/volume_notify_lock ) &
    echo $! > /tmp/volume_notify_lock

    if [ "$volume" = "Muted" ]; then
        notify-send -a "volume" -h int:value:0 -h string:x-dunst-stack-tag:volume --icon /usr/share/icons/breeze-dark/actions/16@2x/player-volume-muted.svg  ""
        return
    fi
    notify-send -a "volume" -h int:value:"${volume%\%}" -h string:x-dunst-stack-tag:volume --icon /usr/share/icons/breeze-dark/actions/16@2x/player-volume.svg  ""
}

get_volume() {
    if amixer get Master | grep -q '\[off\]'; then
        echo "Muted"
        return
    fi
    amixer get Master | awk -F'[][]' '/%/ { print $2 }' | head -n1;
}

if [ "$1" = "notify" ]; then
    notify_volume
else
    get_volume
fi
