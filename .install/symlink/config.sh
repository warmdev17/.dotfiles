DD=~/.dotfiles
CD=~/.config
source ../symlink.sh

_installSymLink fish $CD/fish $DD/fish $CD/fish
_installSymLink kitty $CD/kitty $DD/kitty $CD/kitty
_installSymLink dunst $CD/dunst $DD/dunst $CD/dunst
_installSymLink btop $CD/btop $DD/btop $CD/btop
_installSymLink i3 $CD/i3 $DD/i3 $CD/i3
_installSymLink polybar $CD/polybar $DD/polybar $CD/polybar
_installSymLink picom $CD/picom $DD/picom $CD/picom
_installSymLink rofi $CD/rofi $DD/rofi $CD/rofi
_installSymLink bat $CD/bat $DD/bat $CD/bat

# copy
# mv $DD/tmux/* ~/
# cp -r $DD/.local/share/rofi/themes/catppuccin-macchiato.rasi $DD.local/share/rofi/themes/
# cp -r $DD/oh-my-posh/catppuccin_mocha.omp.json $DD
# sudo mv $DD/etc/modprobe.d/hid_apple.conf /etc/modprobe.d/hid_apple.conf
