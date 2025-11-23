#!/usr/bin/env bash

set -euo pipefail

# install dm and wm
pacman -S xorg wayland sddm hyprland kitty

# install hypr core-utils
pacman -S hyprshot hyprpaper hyprlock hypridle

# install utils
pacman -S waybar rofi swaync dolphin okular ark

# install and setup polkit
pacman -S kwallet kwalletmanager polkit-kde-agent gnupg
gnupg --full-generate-key

# TODO: get configurations
