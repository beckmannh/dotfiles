#!/usr/bin/env sh

# Terminate already running bar instances
killall -q bar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

    polybar -q bar &
