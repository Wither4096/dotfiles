#!/bin/bash
command -v polybar-msg &> /dev/null 2>&1
POLYBAR_EXIST=$?
pamixer --source @DEFAULT_SOURCE@ -t
update_polybar(){
	if pamixer --source @DEFAULT_SOURCE@ --get-mute|grep 'true';then 
		paplay /usr/share/sounds/oxygen/stereo/message-contact-in.ogg
		polybar-msg action '#mictoggle.hook.0';
	else 
		paplay /usr/share/sounds/oxygen/stereo/message-contact-out.ogg
		polybar-msg action '#mictoggle.hook.0';
	fi
}
if [ "$POLYBAR_EXIST" -eq 0 ];then 
	update_polybar
fi
