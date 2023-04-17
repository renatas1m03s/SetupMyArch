 #!/bin/bash

sudo pacman -Sy --noconfirm archlinux-keyring

yay -Sy mesa-git

sleep 5

yay -Sy lib32-mesa-git

sleep 5

yay -Sy xf86-video-amdgpu-git

