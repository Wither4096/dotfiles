#!/bin/bash

sudo pacman -S os-prober fish xorg xorg-xinit i3-wm xdg-user-dirs kitty polkit polkit-gnome iptables-nft nftables imv feh rofi polybar zip unzip unrar intel-ucode pipewire-pulse pamixer wiremix oxygen-sounds nvidia-open nvidia-utils fastfetch thunar tumbler ffmpegthumbnailer ntfs-3g vifm ttf-nerd-fonts-symbols ttf-jetbrains-mono noto-fonts-cjk noto-fonts-emoji noto-fonts btop discord mpv exfat-utils udiskie keepassxc imagemagick dunst xclip playerctl firefox spotify-launcher clipcat rofimoji xdotool xdo

sudo cp desktopconf/X11/xorg.conf.i /etc/X11/
sudo cp desktopconf/X11/xorg.conf.n /etc/X11/
sudo cp desktopconf/X11/xorg.conf.d/50-mouse-acceleration.conf /etc/X11/xorg.conf.d
sudo cp /etc/default/grub /etc/default/grub.old
sudo cp -r files/grubthemes/catppuccin /boot/grub/themes

cp -r desktopconf/.config $HOME
cp -r files/scripts/ $HOME/.local/
mkdir -p $HOME/Pictures/Screenshots/
sudo cp -r files/themes/ /usr/share/
sudo cp -r files/icons/ /usr/share/
cp files/.gtkrc-2.0 $HOME
cp desktopconf/.xinitrc $HOME
cp desktopconf/.bashrc $HOME
cp files/.Xresources $HOME
cp -r files/.vim/ $HOME
cp files/.vimrc $HOME
cp -r files/wallpapers/ $HOME/.config
sudo cp -R files/.vim/ /root/
sudo cp files/.vimrc /root/


sudo cp files/99-noto-reject-nastaliq.conf /etc/fonts/conf.d/

curl -LO https://github.com/werman/noise-suppression-for-voice/releases/latest/download/linux-rnnoise.zip
mkdir -p ~/.local/share/noise-suppression
unzip linux-rnnoise.zip -d ~/.local/share/noise-suppression
systemctl --user enable --now pipewire.service
git clone https://aur.archlinux.org/yay-bin.git

cd yay-bin
makepkg -si
#yay -S feishin-bin #mpd-mpris-bin betterlockscreen ani-cli vscodium-bin python-yams yt-dlp

printf "GRUB_GFXMODE=1360x768\nGRUB_DISABLE_OS_PROBER=false\nGRUB_THEME="/boot/grub/themes/catppuccin/theme.txt""|sudo tee -a /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
