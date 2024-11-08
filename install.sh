#!/bin/bash

sudo pacman -S os-prober fish xorg xorg-xinit i3-wm xdg-user-dirs kitty polkit polkit-gnome feh rofi polybar zip unzip intel-ucode pipewire-pulse pamixer nvidia-open nvidia-utils fastfetch thunar tumbler ffmpegthumbnailer ntfs-3g ttf-nerd-fonts-symbols ttf-jetbrains-mono noto-fonts-cjk noto-fonts-emoji noto-fonts btop discord mpv exfat-utils udiskie keepassxc imagemagick dunst xclip playerctl firefox spotify-launcher clipcat

sudo mv desktopconf/X11/xorg.conf.i /etc/X11/
sudo mv desktopconf/X11/xorg.conf.n /etc/X11/
sudo mv desktopconf/X11/xorg.conf.d/50-mouse-acceleration.conf /etc/X11/xorg.conf.d
sudo cp /etc/default/grub /etc/default/grub.old
sudo mv files/dracula /boot/grub/themes

cp -r .config $HOME
mv files/bin $HOME/.local/
mkdir -p $HOME/Pictures/Screenshots/
sudo mv files/themes/* /usr/share/themes
sudo mv files/icons/* /usr/share/icons
cp files/.gtkrc-2.0 $HOME
cp desktopconf/.xinitrc $HOME
cp desktopconf/.bashrc $HOME
cp files/.Xresources $HOME
mv files/.vim/ $HOME
cp files/.vimrc $HOME

sudo cp files/99-noto-reject-nastaliq.conf /etc/fonts/conf.d/

curl -LO https://github.com/werman/noise-suppression-for-voice/releases/latest/download/linux-rnnoise.zip
mkdir -p ~/.local/share/noise-suppression
unzip linux-rnnoise.zip -d ~/.local/share/noise-suppression
systemctl --user enable --now pipewire.service
git clone https://aur.archlinux.org/yay-bin.git

cd yay-bin
makepkg -si
yay -S feishin-bin #mpd-mpris-bin betterlockscreen ani-cli vscodium-bin python-yams yt-dlp

printf "GRUB_GFXMODE=1360x768\nGRUB_DISABLE_OS_PROBER=false\nGRUB_THEME="/boot/grub/themes/dracula/theme.txt""|sudo tee -a /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
