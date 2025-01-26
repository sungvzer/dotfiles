case $BLOCK_BUTTON in
    1) i3-msg -q "exec --no-startup-id  rofi -show power-menu -modi power-menu:rofi-power-menu";; # Left click, open power menu
esac

echo "Power"
