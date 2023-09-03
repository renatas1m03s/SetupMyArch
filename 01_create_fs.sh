#!/bin/bash

echo -e '\nFormatando Boot, Root e SWAP - Assumindo o esquema de 5 partições - EFI, Boot, Root, Home e SWAP\n'

if test -z "$1"
then 
      echo -e 'Forma de usar: ./create_fs.sh NOME_DO_DISCO  -Ex.: ./create_fs.sh nvme0n1p\n'
else 
      echo -e 'Formatando Boot - /dev/'$1'2 - ext4 - /boot\n'
      mkfs.ext4 -L Boot /dev/$1'2'
      echo -e 'Formatando Root - /dev/'$1'4 - ext4 - /\n'
      mkfs.ext4 -L Root /dev/$1'4'
      echo -e 'Formatando SWAP - /dev/'$1'3 - linux swap\n'
      mkswap /dev/$1'3'
      echo -e 'Formatando Home - /dev/'$1'5 - ext4\n'
      mkfs.ext4 -L Home /dev/$1'5'
      echo -e 'Montando os volumes\n'
      mount /dev/$1'3' /mnt
      mkdir /mnt/boot
      mount /dev/$1'2' /mnt/boot
      mkdir /mnt/boot/efi
      mount /dev/$1'1' /mnt/boot/efi
      mkdir /mnt/home
      mount /dev/$1'4' /mnt/home
      swapon /dev/$1'5'
      mount | grep /mnt
      swapon --show
      echo -e 'create_fs executado' > create_fs.log
fi
