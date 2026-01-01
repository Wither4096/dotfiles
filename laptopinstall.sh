#!/bin/bash

sudo pacman -S os-prober fish sway swaybg swayidle swaylock grim slurp rofi-wayland waybar kitty polkit polkit-gnome iptables-nft nftables feh zip unzip amd-ucode pipewire-pulse pamixer mesa fastfetch thunar tumbler ffmpegthumbnailer xdg-user-dirs ntfs-3g vifm ttf-nerd-fonts-symbols ttf-jetbrains-mono noto-fonts-cjk noto-fonts-emoji noto-fonts btop mpv exfat-utils udiskie keepassxc imagemagick dunst playerctl libreoffice-still qt5-wayland xwayland brightnessctl plymouth sddm fprint qt6-svg qt6-declarative qt5-quickcontrols2 firefox spotify-launcher bluez bluez-utils blueman rofimoji wtype wl-clipboard #discord greetd greetd-tuigreet

sudo cp /etc/default/grub /etc/default/grub.old
sudo mv files/theme /boot/grub/themes

cp -r laptopconf/.config $HOME
mv files/bin $HOME/.local/
sudo mv files/themes/* /usr/share/themes
sudo mv files/icons/* /usr/share/icons
cp files/.gtkrc-2.0 $HOME
cp laptopconf/.bashrc $HOME
cp files/.Xresources $HOME
cp -R files/.vim/ $HOME
cp files/.vimrc $HOME
cp -r files/wallpapers/ $HOME/.config
cp -R files/.vim/ /root/
cp files/.vimrc /root/

sudo cp files/99-noto-reject-nastaliq.conf /etc/fonts/conf.d/

# curl -LO https://github.com/werman/noise-suppression-for-voice/releases/latest/download/linux-rnnoise.zip
# mkdir -p ~/.local/share/noise-suppression
# unzip linux-rnnoise.zip -d ~/.local/share/noise-suppression

sudo systemctl enable sddm.service
systemctl --user enable --now pipewire.service

git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

printf "GRUB_GFXMODE=1920x1080\nGRUB_DISABLE_OS_PROBER=false\nGRUB_THEME="/boot/grub/themes/theme/theme.txt""|sudo tee -a /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
