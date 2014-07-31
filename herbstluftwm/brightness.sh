#!/bin/bash

for f in /sys/class/backlight/{intel_backlight,radeon_bl1}/brightness; do
    [ -f $f ] && brightness="$f"
done

read value < $brightness
case $1 in
    down)
        echo $(($value - 10)) > $brightness
        ;;
    up)
        echo $(($value + 10)) > $brightness
        ;;
esac


