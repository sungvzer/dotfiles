if [ $BLOCK_BUTTON = "1" ]; then
    if pgrep -x "betterbird-bin" > /dev/null; then
        # if Betterbird is in the scratchpad
        if [ "$(~/.config/i3/scripts/get_window_by_mark.sh -c Betterbird -r w)" = "-1" ]; then
            i3-msg -q "[class=Betterbird] scratchpad show"
            i3-msg -q "[class=Betterbird] focus"
            i3-msg -q "[class=Betterbird] floating disable"
    else
            current_workspace=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | tr -d '"')
            i3-msg -q "[class=Betterbird] focus"
            i3-msg -q "[class=Betterbird] move scratchpad"
            i3-msg -q "workspace $current_workspace"
        fi
    else
        i3-msg -q "exec --no-startup-id betterbird -calendar"
    fi
fi

date '+%A %d/%m/%Y'

