#!/bin/bash

sudo pacman -Sy --noconfirm archlinux-keyring

#sudo pacman -Sy --noconfirm mesa lib32-mesa xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon
#sudo pacman -Sy --noconfirm libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau

yay -Sy directx-headers-git

echo -e "\n\nInstalando mesa...\n\n"
sleep 3
yay -Sy mesa-git

echo -e "\n\nInstalando lib32...\n\n"
sleep 3
yay -Sy lib32-mesa-git

echo -e "\n\nInstalando xf86...\n\n"
sleep 3
yay -Sy xf86-video-amdgpu-git
