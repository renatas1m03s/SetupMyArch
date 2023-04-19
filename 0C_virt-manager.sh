 #!/bin/bash

sudo modprobe kvm_intel

sudo pacman -Sy --needed qemu virt-manager dnsmasq iptables-nft edk2-ovmf swtpm

sudo systemctl enable --now libvirtd

sudo virsh net-start --network default

sudo virsh net-autostart default
