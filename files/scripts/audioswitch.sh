#!/bin/bash
if ls /proc/acpi/button/lid/*/state &> /dev/null; then
	if pactl info|grep 'alsa_output.usb-Generic_USB_Audio-00.analog-stereo';then
		pactl set-default-sink alsa_output.pci-0000_04_00.1.HiFi__HDMI2__sink
		paplay /usr/share/sounds/oxygen/stereo/complete-media-burn.ogg
	else
		pactl set-default-sink alsa_output.usb-Generic_USB_Audio-00.analog-stereo
		paplay /usr/share/sounds/oxygen/stereo/complete-media-burn.ogg
	fi
else
	if pactl info|grep 'alsa_output.usb-Generic_USB_Audio-00.analog-stereo';then
		pactl set-default-sink alsa_output.pci-0000_01_00.1.hdmi-stereo
		paplay /usr/share/sounds/oxygen/stereo/complete-media-burn.ogg
	else
		pactl set-default-sink alsa_output.usb-Generic_USB_Audio-00.analog-stereo
		paplay /usr/share/sounds/oxygen/stereo/complete-media-burn.ogg
	fi
fi
