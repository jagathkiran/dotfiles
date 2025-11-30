#!/usr/bin/env bash

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
#	mount =-mkdir dev/sdX1 /mnt/boot
#	swapon /dev/sdX2
#
