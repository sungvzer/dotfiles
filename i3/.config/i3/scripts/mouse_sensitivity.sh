MOUSE_SENSITIVITY=${MOUSE_SENSITIVITY:-0.6}

 while true; do
  NEW_ID=$(xinput | grep 'G7 Mouse' | grep -o -E 'id=[0-9]+' | grep -o -E '[0-9]+')
  if [ "$MOUSEID" != "$NEW_ID" ]; then
    MOUSEID=$NEW_ID
    if [ "$MOUSEID" != "" ]; then
        xinput --set-prop $MOUSEID 147 "$MOUSE_SENSITIVITY" 0 0 0 "$MOUSE_SENSITIVITY" 0 0 0 1;
        echo "Mouse sensitivity set for device ID $MOUSEID" >> ~/mouse_sensitivity.log
    fi
  fi
  sleep 2
done

