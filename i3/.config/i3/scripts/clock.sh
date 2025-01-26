case $BLOCK_BUTTON in
    1) i3-msg -q "exec --no-startup-id gnome-clocks" ;;  # Left click, open gnome-clocks
esac
date '+%H:%M:%S'
