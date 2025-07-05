#!/usr/bin/env bash

export PRIMARY_DISPLAY="$(xrandr | awk '/ primary/{print $1}')"

# Run xidlehook
xidlehook \
  --not-when-fullscreen \
  --not-when-audio \
  --timer 270 \
    '~/.config/i3/scripts/brightness.sh push 10' \
    '~/.config/i3/scripts/brightness.sh pop' \
  --timer 30 \
    '~/.config/i3/scripts/brightness.sh set 100; light-locker-command -l' \
    ''
