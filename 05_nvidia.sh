#!/bin/bash

sudo pacman -Sy --noconfirm archlinux-keyring

# sudo pacman -Sy --noconfirm nvidia nvidia-zen nvidia-libgl nvidia-settings

sudo pacman -S --needed nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader nvidia-libgl
