#!/bin/bash

mkfs.fat -F32 -n EFI /dev/nvme0n1p1
mkfs.ext4 -L Boot /dev/nvme0n1p2
mkswap /dev/nvme0n1p3
mkfs.btrfs -L BTRFS-Root /dev/nvme0n1p4

mount /dev/nvme0n1p4 /mnt
btrfs su cr /mnt/@
btrfs su cr /mnt/@home
btrfs su cr /mnt/@root
btrfs su cr /mnt/@srv
btrfs su cr /mnt/@log
btrfs su cr /mnt/@cache
btrfs su cr /mnt/@tmp
btrfs su li /mnt

umount /mnt

mount -o defaults,noatime,compress=zstd,commit=120,subvol=@ /dev/nvme0n1p4 /mnt

mkdir -p /mnt/{home,root,srv,var/log,var/cache,tmp}

mount -o defaults,noatime,compress=zstd,commit=120,subvol=@home /dev/nvme0n1p4 /mnt/home
mount -o defaults,noatime,compress=zstd,commit=120,subvol=@root /dev/nvme0n1p4 /mnt/root
mount -o defaults,noatime,compress=zstd,commit=120,subvol=@srv /dev/nvme0n1p4 /mnt/srv
mount -o defaults,noatime,compress=zstd,commit=120,subvol=@log /dev/nvme0n1p4 /mnt/var/log
mount -o defaults,noatime,compress=zstd,commit=120,subvol=@cache /dev/nvme0n1p4 /mnt/var/cache
mount -o defaults,noatime,compress=zstd,commit=120,subvol=@tmp /dev/nvme0n1p4 /mnt/tmp

mkdir /mnt/boot
mount /dev/nvme0n1p2 /mnt/boot
mkdir /mnt/boot/efi
mount /dev/nvme0n1p1 /mnt/boot/efi
swapon  /dev/nvme0n1p3

mount | grep nvme
