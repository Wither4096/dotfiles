#!/bin/bash
command -v polybar-msg &> /dev/null 2>&1
POLYBAR_EXIST=$?
pamixer --source @DEFAULT_SOURCE@ -t
update_polybar(){
	if pamixer --source @DEFAULT_SOURCE@ --get-mute|grep 'true';then 
		polybar-msg action '#mictoggle.hook.0';
		paplay /usr/share/sounds/oxygen/stereo/message-contact-out.ogg
	else 
		polybar-msg action '#mictoggle.hook.0';
		paplay /usr/share/sounds/oxygen/stereo/message-contact-in.ogg
	fi
}
if [ "$POLYBAR_EXIST" -eq 0 ];then 
	update_polybar
fi
