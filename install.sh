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
sudo pacman -Sy gum --noconfirm

source ./.install/package.sh
source ./.install/neovim.sh
source ./.install/wallpaper.sh
source ./.install/symlink/config.sh

# ------------------------------------------------------
# Reboot
# ------------------------------------------------------

echo -e "${GREEN}"
figlet "Reboot"
echo -e "${NONE}"
echo "A reboot of your system is recommended."
echo
if gum confirm "Do you want to reboot your system now?"; then
	gum spin --spinner dot --title "Rebooting now..." -- sleep 3
	systemctl reboot
elif [ $? -eq 130 ]; then
	exit 130
else
	echo ":: Reboot skipped"
fi
echo ""
sleep 3
