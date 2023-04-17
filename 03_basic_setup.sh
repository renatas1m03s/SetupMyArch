 #!/bin/bash

echo -e '\nConfigurando timezone e locales\n'

ln -sf /usr/share/zoneinfo/America/Fortaleza /etc/localtime
sed -i s/#en_US.UTF-8/en_US.UTF-8/g /etc/locale.gen && locale-gen && echo LANG=en_US.UTF-8 >> /etc/locale.conf
echo KEYMAP=br-abnt2 >> /etc/vconsole.conf

echo -e '\n Instalando editores de texto básicos e o fish shell\n'

pacman -Sy --noconfirm nano vim vi fish

echo -e '\nConfigurando os arquivos hosts e hostname\n'

echo sagittarius > /etc/hostname

cat hosts.txt >> /etc/hosts

echo -e '\nConfigurando a senha do root\n'

passwd

echo -e '\nConfigurando o usuário renata\n'

useradd -m -g users -G wheel -s /usr/bin/fish renata && passwd renata
echo 'renata ALL=(ALL) ALL' | sudo EDITOR='tee -a' visudo
cat /etc/sudoers

echo -e '\nInstalando os pacotes básicos e habilitando o NetworkManager e sshd\n'

pacman -Sy --noconfirm dosfstools os-prober mtools networkmanager dialog sudo
pacman -Sy --noconfirm rsync grub-efi-x86_64 efibootmgr openssh exfat-utils 

systemctl enable NetworkManager && systemctl enable sshd

echo -e '\nConfigurando o GRUB com thema'

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch_grub --recheck

sed -i s/quiet/quiet nvme_load=YES/g /etc/default/grub
sed -i s/GRUB_GFXMODE=auto/GRUB_GFXMODE=1920x1080,auto/g /etc/default/grub
sed -i s/quiet/quiet nvme_load=YES/g /etc/default/grub
sed -i s/#GRUB_DISABLE_OS_PROBER=false/GRUB_DISABLE_OS_PROBER=false/g /etc/default/grub

echo GRUB_THEME="/usr/share/grub/themes/sagittarius-uw/theme.txt" >> /etc/default/grub

mkdir -p /usr/share/grub/themes/sagittarius-uw

cp -rv ./sagittarius-uw/* /usr/share/grub/themes/sagittarius-uw/

grub-mkconfig -o /boot/grub/grub.cfg

echo -e '\nDefinindo os parâmetros do SSHD\n'

sed -i 's/#Port 22/Port 3389/g' /etc/ssh/sshd_config
sed -i 's/#AddressFamily any/AddressFamily inet/g' /etc/ssh/sshd_config

echo -e 'basic_setup executado' > basic_setup.log

echo -e '\nSetup básico concluído...\n'
