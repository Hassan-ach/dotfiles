#!/bin/sh

# Set US keyboard layout without extra options
setxkbmap -layout us -option ""

# Remap Caps Lock to Ctrl
setxkbmap -option "ctrl:nocaps"

# Remap keycode 108 (Right Alt) to Right Shift
xmodmap -e "keycode 108 = Shift_R"
