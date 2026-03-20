#!/bin/sh
if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  bluetoothctl power on
  polybar-msg action "#bluetooth.hook.1"
else
  bluetoothctl power off
  polybar-msg action "#bluetooth.hook.0"
fi
