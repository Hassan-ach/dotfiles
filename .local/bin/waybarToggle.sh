#!/usr/bin/bash

# Check if waybar is running
if pgrep -x "waybar" > /dev/null; then
    # Waybar is running, kill it
    pkill waybar
    # echo "Waybar stopped"
    # Optional: notify-send "Waybar" "Stopped"
else
    # Waybar is not running, start it
    waybar &
    # echo "Waybar started"
    # Optional: notify-send "Waybar" "Started"
fi
