#!/usr/bin/env bash
#
# playerctlstatus=$(playerctl status 2> /dev/null)
#
# if [[ $playerctlstatus ==  "" ]]; then
#     echo " "
# elif [[ $playerctlstatus =~ "Playing" ]]; then
#     echo "Now playing = %{A1:playerctl pause:}%{A}"
# else
#     echo "Now playing = %{A1:playerctl play:}%{A}"
# fi
#

#!/bin/bash
if	[ "$(playerctl status)" = "Playing" ]; then
	title=`exec playerctl metadata xesam:title`
	artist=`exec playerctl metadata xesam:artist`
	( echo "$title - " | zscroll -n true  -l 50 -d 0.1 ) &

elif	[ "$(playerctl status)" = "Paused" ]; then
	title=`exec playerctl metadata xesam:title`
	artist=`exec playerctl metadata xesam:artist`
	( echo "$title -  " | zscroll -n true -l 50  -d 0.1 ) &
else
	echo ""
fi

