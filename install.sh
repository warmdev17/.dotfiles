#!/bin/bash

mode="live"
source ./.install/symlink.sh
GREEN='\033[0;32m'
NONE='\033[0m'
clear
# Update package databases and upgrade the system
echo -e "${GREEN}"
cat <<"EOF"
                                   _                  _       _    __ _ _           
                                  | |                | |     | |  / _(_) |          
 __      ____ _ _ __ _ __ ___   __| | _____   __   __| | ___ | |_| |_ _| | ___  ___ 
 \ \ /\ / / _` | '__| '_ ` _ \ / _` |/ _ \ \ / /  / _` |/ _ \| __|  _| | |/ _ \/ __|
  \ V  V / (_| | |  | | | | | | (_| |  __/\ V /  | (_| | (_) | |_| | | | |  __/\__ \
   \_/\_/ \__,_|_|  |_| |_| |_|\__,_|\___| \_/    \__,_|\___/ \__|_| |_|_|\___||___/
                                                                 
EOF
echo -e "${NONE}"

echo "This is warmdev dotfile, it just a beta dotfile not stable"
echo "Make sure you have created a backup of your system before installing dotfile"
echo ""

sudo pacman -Syu --noconfirm

source ./.install/package.sh
source ./.install/neovim.sh
source ./.install/wallpaper.sh
