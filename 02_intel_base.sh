#!/bin/bash

echo -e '\nInstalando o sistema base INTEL - linux e linux-zen\n'

pacstrap /mnt base linux linux-firmware linux-headers linux-zen linux-zen-headers dkms base-devel reflector btrfs-progs

echo -e '\nGerando o FSTAB\n'

genfstab -U -p /mnt >> /mnt/etc/fstab

cat ./extra_fstab.txt >> /mnt/etc/fstab

cat /mnt/etc/fstab

echo -e '\nCopiando os arquivos do SetupMyArch\n'

mkdir /mnt/home/SetupMyArch

cp -rv ./* /mnt/home/SetupMyArch

echo -e '\nExecutando o chroot\n'

arch-chroot /mnt sh /home/SetupMyArch/end_intel_base.sh

arch-chroot /mnt

