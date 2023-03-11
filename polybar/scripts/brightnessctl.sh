#!/bin/bash
# By knightfall01 as a part of https://github.com/Knightfall01/Hyprland-i3
BRIGHTNESS_VALUE=`brightnessctl | grep -o "(.*" | tr -d "()"`
BRIGHTNESS_NR=${BRIGHTNESS_VALUE//%}

if [ $BRIGHTNESS_NR -lt 20 ]; then
	BRIGHTNESS_ICON=''
elif [ $BRIGHTNESS_NR -lt 50 ]; then
	BRIGHTNESS_ICON=''
elif [ $BRIGHTNESS_NR -lt 80 ]; then
	BRIGHTNESS_ICON=''
else
	BRIGHTNESS_ICON=''
fi

echo "$BRIGHTNESS_ICON $BRIGHTNESS_VALUE"

