#!/usr/bin/env bash
# Connect to WIFI
# Modified from https://github.com/zbaylin/rofi-wifi-menu/blob/master/rofi-wifi-menu.sh

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US:en"
# Starts a scan of available broadcasting SSIDs
# nmcli dev wifi rescan

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# FIELDS=SSID,SECURITY,BARS,ACTIVE
FIELDS=SSID,BARS,ACTIVE,SECURITY
POSITION=0
XOFF=-30
LOC=3
CACHE=~/.local/tmp/wifi-wofi
WWIDTH=370
MAXHEIGHT=1000

LIST=$(nmcli --fields "$FIELDS" device wifi list | sed '/^--/d' | \
  awk -F "[  ]{2,}" '/SSID/ {next} {;
      sub(/yes/, "", $3);
      sub(/no/, "", $3);
      if ($4 == "--") $4=""; else $4="";
      printf "<tt>%-4s  %-26s </tt>%s   %s\n", $2,$1,$3,$4 }')

# Bluetooth connections
LISTB=$(nmcli --fields NAME,TYPE,ACTIVE con show | \
  awk -F "[  ]{2,}" '/bluetooth/ {;
    sub(/yes/, "", $3);
    sub(/no/, "", $3);
    printf "<tt>   %-26s </tt>%s   \n", $1,$3 }')

# Gives a list of known connections so we can parse it later
KNOWNCON=$(nmcli connection show | awk -F '[[:space:]][[:space:]]+' '{printf "%s\n", $1}')

# Really janky way of telling if there is currently a connection
CONSTATE=$(nmcli -fields WIFI g | awk '/enabled|disabled/ { print $0}')

CURRSSID=$(LANGUAGE=C nmcli -t -f active,ssid dev wifi | awk -F: '$1 ~ /^yes/ {print $2}')

if [[ ! -z $CURRSSID ]]; then
	HIGHLINE=$(echo  "$(echo "$LIST" | awk -F "[  ]{2,}" '{print $2}' | grep -Fxn -m 1 "$CURRSSID" | awk -F ":" '{print $1}') + 1" | bc )
fi

LINENUM=$(echo -e "toggle\nmanual\n${LISTB}\n${LIST}" | wc -l)

# If there are more than 20 SSIDs, the menu will still only have 20 lines
if [ "$LINENUM" -gt 20 ] && [[ "$CONSTATE" =~ "enabled" ]]; then
	LINENUM=20
elif [[ "$CONSTATE" =~ "disabled" ]]; then
	LINENUM=1
fi


if [[ "$CONSTATE" =~ "enabled" ]]; then
	TOGGLE="toggle off"
elif [[ "$CONSTATE" =~ "disabled" ]]; then
	TOGGLE="toggle on"
fi

CHENTRY=$(echo -e "$TOGGLE\nmanual\n$LISTB\n$LIST" | uniq -u | \
    wofi -i --dmenu -p "Wi-Fi SSID: " --width "$WWIDTH" --lines ${LINENUM} --cache-file /dev/null --location $LOC --xoffset $XOFF | awk -F "[  ]{2,}" '{gsub(/<[^>]*>/, ""); print $0}')


CHSSID=$(echo "$CHENTRY" | awk -F "[  ]{2,}" '{print $2}')

# If the user inputs "manual" as their SSID in the start window, it will bring them to this screen
if [ "$CHENTRY" = "manual" ] ; then
	# Manual entry of the SSID and password (if appplicable)
	MSSID=$(echo "enter the SSID of the network (SSID,password)" | wofi --dmenu -p "Manual Entry: ")
	# Separating the password from the entered string
	MPASS=$(echo "$MSSID" | awk -F "," '{print $2}')

	# If the user entered a manual password, then use the password nmcli command
	if [ "$MPASS" = "" ]; then
		nmcli dev wifi con "$MSSID"
	else
		nmcli dev wifi con "$MSSID" password "$MPASS"
	fi

elif [ "$CHENTRY" = "toggle on" ]; then
	nmcli radio wifi on

elif [ "$CHENTRY" = "toggle off" ]; then
	nmcli radio wifi off

else

	# If the connection is already in use, then this will still be able to get the SSID
	if [ "$CHSSID" = "*" ]; then
		CHSSID=$(echo "$CHENTRY" | sed  's/\s\{2,\}/\|/g' | awk -F "|" '{print $3}')
	fi

	# Parses the list of preconfigured connections to see if it already contains the chosen SSID. This speeds up the connection process

	if [[ $(echo "$KNOWNCON" | grep -w "$CHSSID") = "$CHSSID" ]]; then
		nmcli con up "$CHSSID"
	else
		nmcli dev wifi con "$CHSSID"
	fi

fi
