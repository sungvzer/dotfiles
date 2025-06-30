#!/bin/sh

# Query with ddcutil
DDC_DISPLAY=$(ddcutil detect | grep -oP 'Display (\d+)' | awk '{print $2}')

set_brightness() {
    local brightness=$1
    ddcutil --display "$DDC_DISPLAY" setvcp 10 "$brightness"
}

save_brightness() {
    BRIGHTNESS=$(ddcutil --display 1 getvcp 10 | grep -oP 'current value *= *\d+' | awk '{print $4}')
    echo "$BRIGHTNESS" > ~/.cache/brightness.txt
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
    CURRENT=$(ddcutil --display "$DDC_DISPLAY" getvcp 10 | grep -oP 'current value *= *\d+' | awk '{print $4}')
    NEW=$((CURRENT + 10))
    if [ "$NEW" -gt 100 ]; then
        NEW=100
    fi
    set_brightness "$NEW"
}

decrease_brightness() {
    CURRENT=$(ddcutil --display "$DDC_DISPLAY" getvcp 10 | grep -oP 'current value *= *\d+' | awk '{print $4}')
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
