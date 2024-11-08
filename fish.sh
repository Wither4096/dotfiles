#!/bin/bash

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
echo "omf install bobthefish"|fish
printf "set -g theme_display_hostname yes\n set -g theme_color_scheme dracula" >> ~/.config/fish/config.fish
