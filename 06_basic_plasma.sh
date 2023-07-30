#!/bin/bash

yay -Sy --noconfirm wireplumber pipewire-alsa pipewire-pulse lib32-pipewire

yay -Sy --noconfirm network-manager-applet cronie inetutils dnsutils python-pip

yay -Sy --noconfirm bluez bluez-utils blueman conky

yay -Sy sddm-git xorg xorg-xwayland xorg-xlsclients qt5-wayland glfw-wayland

yay -Sy --noconfirm plasma packagekit-qt5 gnome-disk-utility konsole

yay -Sy --needed plasma-wayland-session egl-wayland

yay -Sy --noconfirm okular dolphin konsole ark spectacle gwenview geany kcalc openconnect networkmanager-openconnect

yay -Sy --noconfirm ffmpeg smplayer kio kio-extras ffmpegthumbs kdegraphics-thumbnailers

yay -Sy --noconfirm kimageformats qt5-imageformats kdesdk-thumbnailers neofetch openvpn

yay -Sy --noconfirm resvg raw-thumbnailer google-chrome snapd

yay -Sy pamac-aur

yay -Sy --noconfirm update-grub pamac-tray-icon-plasma

sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

yay -Sy --noconfirm adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts noto-fonts noto-fonts-cjk noto-fonts-emoji

sudo mkdir /usr/share/fonts/WindowsFonts
sudo cp -rv /mnt/Backup/Documents/LinuxCustomizations/MS-Fonts/* /usr/share/fonts/WindowsFonts/
sudo chmod 644 /usr/share/fonts/WindowsFonts/*
sudo fc-cache –force

sudo systemctl enable sddm

