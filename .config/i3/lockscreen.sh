#!/bin/sh

BG='#191724'        # Base background (Dark purple/blue)
FG='#e0def4'        # Text foreground (Soft off-white)
ACCENT='#31748f'    # Muted cyan/blue accent
HIGHLIGHT='#f6e0cc' # Soft peach highlight
ERROR='#eb6f92'     # Soft pink/red error color
SUCCESS='#9ccfd8'   # Muted blue success color
WARNING='#96c177'   # Warm amber warning color

# Transparency & Effects
BLANK='#00000000'   # Fully transparent
CLEAR='#19172488'   # Semi-transparent base background


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
    --time-size=22 \
    --date-size=12 \
    --layout-size=14 \
    --radius=100 \
    --ring-width=3 \
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



# ICON=$HOME/Downloads/ai-generated-7883443_640.jpg
# TMPBG=/tmp/screen.png
# maim $TMPBG
# magick $TMPBG -blur 0x5 $TMPBG
# magick $TMPBG $ICON -gravity center -composite -matte $TMPBG
# i3lock -u -i $TMPBG
