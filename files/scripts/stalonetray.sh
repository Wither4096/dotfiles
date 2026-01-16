#!/bin/bash
hidden=~/.cache/trayhidden
if [[ $(pidof stalonetray) ]]; then
	if [[ ! -e $hidden ]]; then
		polybar-msg action "#systray.hook.0"
		xdo hide -n stalonetray
		touch "$hidden"
	else
		polybar-msg action "#systray.hook.1"
		xdo show -n stalonetray
		xdo raise -n stalonetray
		rm "$hidden"
	fi
else
	polybar-msg action "#systray.hook.0"
	stalonetray &
	disown
	sleep 1
	xdo hide -n stalonetray
fi
