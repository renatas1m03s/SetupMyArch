#!/bin/bash

sudo pacman -Sy --noconfirm archlinux-keyring

sudo pacman -Sy --noconfirm nvidia nvidia-zen nvidia-libgl mesa opencl-nvidia

yay -Sy --noconfirm supergfxctl

sudo systemctl enable supergfxd.service
