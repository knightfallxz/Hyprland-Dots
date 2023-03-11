#!/bin/sh
# By knightfall01 as a part of https://github.com/Knightfall01/Hyprland-i3
if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  echo "%{F#66ffffff}"
else
  if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]
  then 
    echo ""
  fi
  echo "%{F#2193ff}"
fi

