#!/bin/bash

RUNDIR=$(dirname $0)

sudo pacman -S qemu libvirt virt-manager iptables-nft dnsmasq #dmidecode

sudo systemctl enable libvirtd.service --now

sudo systemctl enable virtlogd.socket --now

sudo virsh net-autostart default

sudo virsh net-start default

sudo sed -i '85s/.//' /etc/libvirt/libvirtd.conf

sudo sed -i '95s/.//' /etc/libvirt/libvirtd.conf

#sudo cp $RUNDIR/90-usb-libvirt-hotplug.rules /etc/udev/rules.d/

sudo sed -i "s/GRUB_CMDLINE_LINUX_DEFAULT=\"/&intel_iommu=on /" "/etc/default/grub"

sudo sed -i "s/MODULES=(/&vfio_pci vfio vfio_iommu_type1/" "/etc/mkinitcpio.conf"

sudo grub-mkconfig -o /boot/grub/grub.cfg

sudo mkinitcpio -P

sudo usermod -a -G libvirt $(whoami)

#newgrp libvirt
