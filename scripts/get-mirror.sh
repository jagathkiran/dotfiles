#!/usr/bin/env bash

set -euo pipefail

# system update
pacman -Syu

# install reflector
pacman -S reflector

# backup mirrorlist
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak

# create new mirrorlist for IN
reflector -c "IN" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist
