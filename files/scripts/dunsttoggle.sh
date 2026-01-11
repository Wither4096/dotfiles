#/bin/bash
if dunstctl is-paused -e;then
	dunstctl set-paused toggle
	paplay /usr/share/sounds/oxygen/stereo/game-over-winner.ogg
	polybar-msg action '#notifications-toggle.hook.0';
else
	dunstctl set-paused toggle
	paplay /usr/share/sounds/oxygen/stereo/game-over-loser.ogg
	polybar-msg action '#notifications-toggle.hook.0';
fi
