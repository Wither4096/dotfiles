#!/bin/sh

music_dir="/drives/storage/Media/Music"
previewdir="$HOME/.cache/"
filename="$(mpc --format "$music_dir"/%file% current)"
previewname="$previewdir/ncmpcppcover.png"
image="$(mpc --format "$music_dir"/%file% current)"

rm $HOME/.cache/ncmpcppcover.png
[ -e "$previewname" ] || ffmpeg -y -i "$filename" -an -vf scale=128:128 "$previewname" > /dev/null 2>&1
notify-send -r 27072 "Now Playing" "$(mpc --format '%title% \n%artist% - %album%' current)" -i "$previewname"
