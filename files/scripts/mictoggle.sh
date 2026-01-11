#!/bin/bash
if pamixer --source @DEFAULT_SOURCE@ --get-mute|grep 'true';then 
	pamixer --source @DEFAULT_SOURCE@ -t
	paplay /usr/share/sounds/oxygen/stereo/message-contact-in.ogg
	polybar-msg action '#mictoggle.hook.0';
else 
	pamixer --source @DEFAULT_SOURCE@ -t
	paplay /usr/share/sounds/oxygen/stereo/message-contact-out.ogg
	polybar-msg action '#mictoggle.hook.0';
fi
