#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar for each
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    primary_m="$(xrandr --query | grep "^${m} " | grep " primary")"
    # If primary monitor, attach system tray to polybar in primary monitor
    if ! [[ -z "${primary_m}" ]]; then
      env SHELL=/bin/sh MONITOR="${m}" TRAY_POS=right polybar barbottom &
    else
      env SHELL=/bin/sh MONITOR="${m}" TRAY_POS=none polybar barbottom &
    fi
  done
  echo "Bars launched..."
else
  echo "Error: Not using xrandr"
fi
