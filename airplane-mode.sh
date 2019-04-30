#!/bin/bash

st=$(nmcli r wifi)

if [ $st == "enabled" ]
then
	nmcli r wifi off
	/usr/bin/notify-send -i airplane-mode-on "Airplane mode on."
else
	nmcli r wifi on
	/usr/bin/notify-send -i airplane-mode-off "Airplane mode off."
fi
