#!/bin/bash

BATPATH=/sys/class/power_supply/BAT0
BAT_FULL=$BATPATH/charge_full
BAT_NOW=$BATPATH/charge_now
STAT=$BATPATH/status
bf=$(cat $BAT_FULL)
bn=$(cat $BAT_NOW)
bs=$(cat $STAT)
if [ $(( 100 * $bn / $bf )) -lt 20 ] && [ $bs == "Discharging" ]
then
    /usr/bin/notify-send -u critical "Battery is running low."
elif [ $(( 100 * $bn / $bf )) -gt 80 ] && [ $bs == "Charging" ]
then
	/usr/bin/notify-send -u critical "Unplug charger."	
fi
