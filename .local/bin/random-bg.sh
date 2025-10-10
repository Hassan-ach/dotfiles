#!/bin/bash

# Pick a random wallpaper
random_wallpaper=$(find ~/wallpapers -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) | shuf -n 1)

ln -sf "$random_wallpaper" /tmp/random_bg
swww img /tmp/random_bg  --transition-type none --transition-duration 1
