case $BLOCK_BUTTON in
    1) i3-msg -q "exec --no-startup-id alacritty -e zsh -c 'paru'" ;;  # Left click, open terminal with paru
esac
checkupdates | wc -l | awk '{printf "There are <span color=\"#a6da95\">%s</span> updates available\n", $1}'
