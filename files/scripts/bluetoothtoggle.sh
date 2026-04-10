#!/bin/sh

BT_STATE=$(bluetoothctl show | grep "Powered: yes" | wc -c)
command -v polybar-msg &> /dev/null 2>&1
POLYBAR_EXIST=$?

update_polybar(){
	if [ $BT_STATE -eq 0 ];then
		polybar-msg action "#bluetooth.hook.1"
	else
		polybar-msg action "#bluetooth.hook.0"
	fi
}

if [ $BT_STATE -eq 0 ];then
  bluetoothctl power on
else
  bluetoothctl power off
fi

if [ $POLYBAR_EXIST -eq 0 ];then
	update_polybar
fi
