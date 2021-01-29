#!/bin/zsh -ie

# a script i made when my fiancee asked me if it was possible 
# to switch her left and right screens off with a shortcut
# i actually use this one myself, since it is really handy
# for just reducing light when watching a movie or other on the PC 

# to use this script you need to set the following ENVVARS:
# SCREEN_LEFT           to the output name of your left screen
# SCREEN_LEFT_MODE      to the resolution of your left screen
# SCREEN_RIGHT          to the output name of your right screen 
# SCREEN_RIGHT_MODE     to the resolution of your right screen

if [[ "$1" == "left" ]];
then
    SCREEN=$SCREEN_LEFT
    SCREEN_MODE=$SCREEN_LEFT_MODE
else
    SCREEN=$SCREEN_RIGHT
    SCREEN_MODE=$SCREEN_RIGHT_MODE
fi

if [[ `xrandr | grep $SCREEN -A 1 | tail -n 1` == *"*"* ]];
then
    notify-screen off $SCREEN
    xrandr --output $SCREEN --off
else
    notify-screen on $SCREEN
    xrandr --output $SCREEN --mode $SCREEN_MODE --rate 60 --left-of $SCREEN_CENTER
fi
