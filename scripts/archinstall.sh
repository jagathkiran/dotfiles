#!/usr/bin/env bash
set -euo pipefail

# TODO: load-keymaps.sh
#
# TODO: connect to internet
#
# TODO: set-timezone.sh
#
# TODO: figure out how to automate the creation of partitions
#
# ####
# get the diskname that you want to use (fdisk -l)
#
# open fdisk for that disk (fdisk /dev/sdX)
# delete all the partitions in that disk (d)
#
# create partitions (n)
#	1. +512M
#	2. +4G
#	3. MAX
#
# change type (t)
#	1. EFI
#	2. Linux Swap
#
# write the changes to the disk (w)
#
# create filesystem
#	mkfs.fat -F32 /dev/sdX1
#	mkswap /dev/sdX2
#	mkfs.ext4 /dev/sdX3 # ext4 or btrfs whatever you like
#
# mount the filesystem
#	mount /dev/sdX3 /mnt
#	mount --mkdir dev/sdX1 /mnt/boot
#	swapon /dev/sdX2
#
# ####
#
# TODO: get-mirrors.sh
#
# install the system on /mnt
pacstrap -K /mnt base linux linux-firmware neovim intel-ucode sudo networkmanager

# configure the system
# fstab
genfstab -U /mnt >>/mnt/etc/fstab

# go chroot on /mnt
arch-chroot /mnt

# set localtime
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
hwclock --systohc

# localization
file="/etc/locale.gen"
if grep -q "en_IN" "$file"; then
	sed -i 's/^[[:space:]]*#[[:space:]]*//' "$file"
fi
locale-gen
localectl set-locale LANG=en_IN.UTF-8

# keymap
export KEYMAP=us >/etc/vconsole.conf
echo localhost >/etc/hostname
touch /etc/hosts

# install bootloader
mount --mkdir /dev/sdX1 /boot/efi
grub-install --target=x86_64-efi \
	--bootloader-id=GRUB \
	--efi-directory=/boot/efi/
grub-mkconfig -o /boot/grub/grub.cfg

# install sudo
# pacman -S sudo

# create new user
username = # add your username here # TODO: figure out whether to take user input or not
useradd -m "$username"
passwd "$username" # create password

# give user permissions
usermod -aG wheel,audio,video,storage "$username"

# install devtools
pacman -S base-devel stow man git curl wget

# exit arch-chroot
exit

# unmount
umount -l /mnt
