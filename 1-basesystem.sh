#!/bin/bash

echo 'Instalando os pacotes base'

pacstrap /mnt base linux linux-firmware linux-headers dkms base-devel intel-ucode linux-zen linux-zen-headers

sleep 2

echo 'Gerando o fstab'

genfstab -U -p /mnt >> /mnt/etc/fstab

cat extra-fstab >> /mnt/etc/fstab

cat /mnt/etc/fstab

sleep 2

arch-chroot /mnt
