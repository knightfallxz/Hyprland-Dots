#!/bin/sh
LAYOUT=$(hyprctl devices -j | jq '.keyboards[3] .active_keymap' | sed 's/"//g')
case $LAYOUT in
  "English (US)")
     echo "en"
  ;;
  "Russian")
      echo "ru"
  ;;
esac
