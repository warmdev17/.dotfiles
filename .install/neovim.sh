figlet "Neovim"
if gum confirm "Do you want to install the warmdev Neovim configuration?"; then
	_installSymLink nvim ~/.config/nvim ~/.dotfiles/nvim ~/.config/nvim
elif [ $? -eq 130 ]; then
	echo ":: Installation canceled."
	exit 130
else
	echo ":: Installation canceled."
	exit
fi
