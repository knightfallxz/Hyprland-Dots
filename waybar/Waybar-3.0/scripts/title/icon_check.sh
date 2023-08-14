#!/usr/bin/env bash
#

app_name=$(hyprctl activewindow | grep -oP 'class: \K[^\s]+')

if [ -z "$app_name" ]; then
  echo ""
else
  echo "󪥒"
fi
