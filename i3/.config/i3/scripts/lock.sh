#!/usr/bin/env bash

export PRIMARY_DISPLAY="$(xrandr | awk '/ primary/{print $1}')"

# Funzione per eseguire il blocco e ripristinare picom dopo lo sblocco
lock_session() {
    # 1. Termina picom per liberar la memoria della GPU ed evitare il blackout
    killall -q picom

    # 2. Ripristina la luminosità al 100% prima del blocco
    ~/.config/i3/scripts/brightness.sh set 100

    # 3. Avvia il blocco con light-locker (modalità bloccante/sincrona)
    light-locker-command -l

    # 4. Riavvia picom solo DOPO che l'utente ha inserito la password e sbloccato la sessione
    picom -b
}

export -f lock_session

# Avvia xidlehook
xidlehook \
    --not-when-fullscreen \
    --not-when-audio \
    --timer 270 \
    '~/.config/i3/scripts/brightness.sh push 10' \
    '~/.config/i3/scripts/brightness.sh pop' \
    --timer 30 \
    'bash -c lock_session' \
    ''
