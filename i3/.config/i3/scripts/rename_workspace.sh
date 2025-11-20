#/bin/bash

mkdir -p "$HOME/.cache/i3"
touch "$HOME/.cache/i3/workspaces.txt"

# Rename current workspace by prompting for a name using rofi
NEW_NAME=$(rofi -dmenu -p "New workspace name:" -l 10 -input "$HOME/.cache/i3/workspaces.txt" -i)
if [ -n "$NEW_NAME" ]; then
    # Get the current workspace number
    CURRENT_WS=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true) | .num')

    # Rename the workspace
    i3-msg "rename workspace to \"$CURRENT_WS - $NEW_NAME\""

    # Save the new name to a cache file for future use if it doesn't already exist
    grep -qxF "$NEW_NAME" "$HOME/.cache/i3/workspaces.txt" || echo "$NEW_NAME" >>"$HOME/.cache/i3/workspaces.txt"
fi
