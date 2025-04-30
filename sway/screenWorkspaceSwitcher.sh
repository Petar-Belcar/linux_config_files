#!/bin/bash

main=$2
left=$3

if [ "$1" == "on" ]; then
    swaymsg "output $main disable"
    swaymsg "workspace 1; move workspace to output $left"
    swaymsg "workspace 2; move workspace to output $left"
    swaymsg "workspace 3; move workspace to output $left"
elif [ "$1" == "off" ]; then
    swaymsg "output $main enable"
    swaymsg "workspace 1; move workspace to output $main"
    swaymsg "workspace 2; move workspace to output $main"
    swaymsg "workspace 3; move workspace to output $main"
fi
