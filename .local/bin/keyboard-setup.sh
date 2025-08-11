#!/bin/sh

# Set US keyboard layout
setxkbmap -layout us -option ""

# Remap Caps Lock → Ctrl
setxkbmap -option ctrl:nocaps

# Remap Alt_L → Shift_L (replace 64 with your Alt_L keycode)
xmodmap -e "keycode 64 = Shift_L"

# Remap Alt_R → Shift_R (replace 108 with your Alt_R keycode)
# xmodmap -e "keycode 108 = Shift_R"
