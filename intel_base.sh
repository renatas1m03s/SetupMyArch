 #!/bin/bash

echo -e '\nInstalando o sistema base INTEL - linux e linux-zen\n'

pacstrap /mnt base linux linux-firmware linux-headers linux-zen linux-zen-headers dkms base-devel

echo -e '\nGerando o FSTAB\n'

genfstab -U -p /mnt >> /mnt/etc/fstab

cat ./extra_fstab.txt >> /mnt/etc/fstab

cat /mnt/etc/fstab
