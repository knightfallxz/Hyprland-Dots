#!/bin/sh
# By knightfall01 as a part of https://github.com/Knightfall01/Hyprland-i3
if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  bluetoothctl power on
else
  bluetoothctl power off
fi
