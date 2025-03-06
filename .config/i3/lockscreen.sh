#!/bin/sh

alpha='dd'

# Unified Dark Color Palette
BG='#121212'        # Background (Very Dark Gray)
FG='#c1c1c1'        # Foreground (Soft Light Gray)
ACCENT='#888888'    # Accent Color (Muted Gray-Blue)
HIGHLIGHT='#999999' # Slightly Brighter Accent
ERROR='#5f8787'     # Cool Muted Cyan for Errors
SUCCESS='#9b8d7f'   # Muted Warm Beige for Success
WARNING='#8c7f70'   # Soft Brownish Accent

# Transparency & Effects
BLANK='#00000000' # Fully Transparent
CLEAR='#12121288' # Semi-transparent Dark Gray

i3lock \
    --insidever-color=$CLEAR \
    --ringver-color=$SUCCESS \
    \
    --insidewrong-color=$CLEAR \
    --ringwrong-color=$ERROR \
    \
    --inside-color=$BLANK \
    --ring-color=$ACCENT \
    --line-color=$BLANK \
    --separator-color=$HIGHLIGHT \
    \
    --verif-color=$FG \
    --wrong-color=$FG \
    --time-color=$HIGHLIGHT \
    --date-color=$HIGHLIGHT \
    --layout-color=$FG \
    --keyhl-color=$WARNING \
    --bshl-color=$ERROR \
    \
    --time-size=32 \
    --date-size=22 \
    --layout-size=24 \
    --radius=140 \
    --ring-width=10 \
    \
    --screen 1 \
    --blur 7 \
    --clock \
    --indicator \
    --time-str="%I:%M:%S %p" \
    --date-str="%a, %d %B %Y" \
    \
    --pass-media-keys \
    --pass-screen-keys \
    --pass-volume-keys \
    \
    --time-font="Iosevka Term" \
    --date-font="Iosevka Term" \
    --layout-font="Iosevka Term" \
    --verif-font="Iosevka Term" \
    --wrong-font="Iosevka Term"
