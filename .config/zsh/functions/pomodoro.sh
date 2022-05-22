#!/bin/sh

# It's some simple functions to have a lighweight Pomodoro Timer
# I like to do a 4:1 with 30m working sessions, 10m short breaks and 20m long breaks.

tomato-work () {
	sleep 30m && notify-send "Break time\!" &
}

tomato-shortb () {
	sleep 10m && notify-send "Tomato time\!" &
}

tomato-longb () {
	sleep 20m && notify-send "Tomato time\!" &
}
