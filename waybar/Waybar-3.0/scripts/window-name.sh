#!/bin/env bash

hyprctl activewindow | grep -oP 'class: \K[^\s]+'
