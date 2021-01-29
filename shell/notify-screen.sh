#!/bin/bash
MODE=$1
ATTR=$2

# so my fiance asked me whether it was possible to switch her screen refresh rate with a shortcut
# so i said "yeah, gimme a bit", she also asked if it was possible to switch the secondary screens off with another shortcut
# so i also did that, it works great, but it was missing something. And this is what i came up with.

# The assets used are not mine, i only provide them fore completeness sake.


ICONPATH="$PWD/assets/icons"
echo $ICONPATH/cs-screen.png

if [[ "$MODE" == "off" ]] || [[ "$MODE" == "on" ]]; then
        notify-send --icon="$ICONPATH/cs-screen.png" "Screen Notify" "Screen $ATTR was turned $MODE"
elif [[ "$MODE" == "rate" ]]; then
    if [[ "$ATTR" == "144" ]]; then
        MODE=pcmr
    else
        MODE=noob
    fi
    echo "${MODE^^} MODE"
    notify-send --icon="$ICONPATH/${MODE}_icon.png" "${MODE^^} MODE" "Main Screen running at ${ATTR}Hz"
fi