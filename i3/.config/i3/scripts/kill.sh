# Get currently focused i3 window class
focused_window=$(xdotool getwindowfocus)
window_class=$(xprop -id $focused_window | grep "WM_CLASS" | awk -F '"' '{print $4}')

is_betterbird=$(grep -q "Betterbird" <<< "$window_class")

# if is_betterbird
if [ $? -eq 0 ]; then
    # If the focused window is Betterbird, close the current tab
    BLOCK_BUTTON=1 ~/.config/i3/scripts/calendar.sh
else
    # Otherwise, kill the focused window
    i3-msg kill
fi
