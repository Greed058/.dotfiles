#!/bin/sh

# Get the current session type (x11 or wayland)
SESSION_TYPE=$(loginctl show-session $(loginctl | grep $(whoami) | awk '{print $1}') -p Type --value)

# Check if the session type is Xorg (x11), and if so, lock the screen
if [ "$SESSION_TYPE" = "x11" ]; then
  export DISPLAY=:0
  /usr/bin/betterlockscreen -l dim
fi
