#!/bin/sh

# If saved ddcdisplay is not found, use ddcutil to detect the display,
# otherwise use the saved display.

if [ ! -f ~/.cache/ddcbus.txt ]; then
    ddcutil detect | rg '/dev/i2c-(\d*)' -or '$1' >~/.cache/ddcbus.txt
fi

DDC_BUS=$(cat ~/.cache/ddcbus.txt | head -n 1)

notify_brightness() {
    local brightness=$1
    icon="/usr/share/icons/breeze-dark/actions/24/"

    if [ "$brightness" -ge 50 ]; then
        icon+="brightness-high.svg"
    else
        icon+="brightness-low.svg"
    fi
    notify-send -a "brightness" -h int:value:"$brightness" -h string:x-dunst-stack-tag:brightness --icon "$icon" ""

}

set_brightness() {
    local brightness=$1
    notify_brightness $brightness
    ddcutil --bus "$DDC_BUS" setvcp 10 "$brightness"
}

save_brightness() {
    BRIGHTNESS=$(ddcutil --bus "$DDC_BUS" getvcp 10 | grep -oP 'current value *= *\d+' | awk '{print $4}')
    echo "$BRIGHTNESS" >~/.cache/brightness.txt
}

restore_brightness() {
    if [ -f ~/.cache/brightness.txt ]; then
        local brightness=$(cat ~/.cache/brightness.txt)
        set_brightness "$brightness"
    else
        echo "No saved brightness found."
    fi
}

increase_brightness() {
    CURRENT=$(ddcutil --bus "$DDC_BUS" getvcp 10 | grep -oP 'current value *= *\d+' | awk '{print $4}')
    NEW=$((CURRENT + 10))
    if [ "$NEW" -gt 100 ]; then
        NEW=100
    fi
    set_brightness "$NEW"
}

decrease_brightness() {
    CURRENT=$(ddcutil --bus "$DDC_BUS" getvcp 10 | grep -oP 'current value *= *\d+' | awk '{print $4}')
    NEW=$((CURRENT - 10))
    if [ "$NEW" -lt 0 ]; then
        NEW=0
    fi
    set_brightness "$NEW"
}

case "$1" in
increase)
    increase_brightness
    ;;
decrease)
    decrease_brightness
    ;;
push)
    if [ -z "$2" ]; then
        exit 1
    fi
    save_brightness
    set_brightness "$2"
    ;;
pop)
    restore_brightness
    ;;
set)
    if [ -z "$2" ]; then
        exit 1
    fi
    rm -f ~/.cache/brightness.txt
    set_brightness "$2"
    ;;
*)
    exit 1
    ;;
esac
