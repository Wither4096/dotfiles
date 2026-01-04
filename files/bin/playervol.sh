#!/bin/bash
volume=$(playerctl -s --player="$(cat ~/.cache/player)" volume |awk '{printf ("%.0f%\n",$1*100)}')
if [ -z $volume ];then
	echo '  ';else 
	echo " $volume "; 
fi
