#/bin/bash
command -v polybar-msg &> /dev/null 2>&1
POLYBAR_EXIST=$?
dunstctl set-paused toggle
update_polybar(){
	if dunstctl is-paused -e;then
		polybar-msg action '#notifications-toggle.hook.0'
		paplay /usr/share/sounds/oxygen/stereo/game-over-loser.ogg
	else
		polybar-msg action '#notifications-toggle.hook.0'
		paplay /usr/share/sounds/oxygen/stereo/game-over-winner.ogg
	fi
}
if [ $POLYBAR_EXIST -eq 0 ];then
	update_polybar
fi
