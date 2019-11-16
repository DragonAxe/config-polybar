#!/bin/sh

# Source: https://github.com/polybar/polybar-scripts/tree/master/polybar-scripts/updates-arch-combined

if ! updates=$(checkupdates 2> /dev/null | wc -l ); then
    updates=0
fi

if [ "$updates" -gt 0 ]; then
    echo "  $updates"
else
    echo ""
fi
