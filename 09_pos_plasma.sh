#!/bin/bash

yay -Sy --noconfirm plasma5-applets-virtual-desktop-bar-git

sudo mkdir -v /usr/share/plasma/desktoptheme/Utterly-Round

sudo cp -v ./Utterly-Round-Desktop.tar.xz /usr/share/plasma/desktoptheme/Utterly-Round/

cd /usr/share/plasma/desktoptheme/Utterly-Round

sudo tar -xvf ./Utterly-Round-Desktop.tar.xz

cd /home/SetupMyArch

sudo systemctl enable --now bluetooth
sudo systemctl enable --now cronie

cp -v /home/SetupMyArch/functions/* /home/renata/.config/fish/functions/

pip3 install pysimplegui pyperclip
sudo pacman -Sy --noconfirm xsel tk

if [ ! -d ~/.local/share/applications ]; then
	mkdir ~/.local/share/applications
fi

if [ ! -d ~/.local/share/icons ]; then
	mkdir ~/.local/share/icons
fi

cp -v /mnt/Backup/Home/.local/share/applications/launcher.desktop /home/renata/.local/share/applications/
cp -v /mnt/Backup/Home/.local/share/applications/DaVinciResolve.desktop /home/renata/.local/share/applications/
cp -v /mnt/Backup/Home/.local/share/applications/geany.desktop /home/renata/.local/share/applications/

cp -rv /mnt/Backup/Home/.local/share/icons/* ~/.local/share/icons

sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp

echo -e "\n\nApós acabar executar:\n\nomf install lambda && omf theme lambda\n\n"

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
