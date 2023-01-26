#!/bin/bash

while true
do
	if [ "$(playerctl status >> /dev/null 2>&1; echo $?)" == "1" ]
	then
		$(polybar-msg hook playpause 1)
	fi

	if [ "$(playerctl status)" == "Playing" ]
	then
		$(polybar-msg hook playpause 2)
	fi

	if [ "$(playerctl status)" == "Paused" ]
	then
		$(polybar-msg hook playpause 3)
	fi
done

