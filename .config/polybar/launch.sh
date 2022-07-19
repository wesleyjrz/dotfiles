#!/usr/bin/env bash

CONFIG="$XDG_CONFIG_HOME/polybar/config.ini"

# Terminate already running bar instances
pkill polybar

# Wait until the processes have been shut down
while pgrep --uid $UID --exact polybar >/dev/null; do sleep 1; done

# Launch the bar
polybar --quiet main --config="$CONFIG" &
