 #!/bin/bash

sudo pacman -Sy --noconfirm pipewire lib32-pipewire wireplumber pipewire-alsa pipewire-pulse 

sudo pacman -Sy --noconfirm network-manager-applet cronie inetutils dnsutils python-pip

sudo pacman -Sy --noconfirm bluez bluez-utils blueman conky

sudo pacman -Sy --noconfirm xorg sddm plasma packagekit-qt5 gnome-disk-utility konsole

sudo pacman -Sy --noconfirm okular dolphin konsole ark spectacle gwenview geany kcalc openconnect networkmanager-openconnect

sudo pacman -Sy --noconfirm ffmpeg smplayer kio kio-extras ffmpegthumbs kdegraphics-thumbnailers

sudo pacman -Sy --noconfirm kimageformats qt5-imageformats kdesdk-thumbnailers neofetch  

yay -Sy --noconfirm resvg raw-thumbnailer google-chrome snapd

yay -Sy pamac-aur

sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

sudo pacman -S --noconfirm adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts noto-fonts noto-fonts-cjk noto-fonts-emoji

sudo mkdir /usr/share/fonts/WindowsFonts
sudo cp -rv /mnt/Backup/Documents/LinuxCustomizations/MS-Fonts/* /usr/share/fonts/WindowsFonts/
sudo chmod 644 /usr/share/fonts/WindowsFonts/*
sudo fc-cache –force

sudo systemctl enable sddm

