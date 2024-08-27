#!/bin/bash

# Path to the battery status file
BATTERY_STATUS_PATH="/sys/class/power_supply/BAT0/status"

# Check if the battery status file exists
if [[ -f "$BATTERY_STATUS_PATH" ]]; then
    # Read the battery status
    BATTERY_STATUS=$(cat "$BATTERY_STATUS_PATH")
    if [[ "$BATTERY_STATUS" == "Discharging" ]]; then
	    $(xrandr --screen 0 -r 60)
    else
	    $(xrandr --screen 0 -r 240)
    fi
else
    echo "Battery status file not found!"
fi

