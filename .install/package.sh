package_install() {
	if [ -f pacman_packages.txt ]; then
		echo "Installing pacman packages..."
		sudo pacman -S --needed - <pacman_packages.txt
	else
		echo "pacman_packages.txt not found!"
	fi

	# Install yay
	if ! command -v yay &>/dev/null; then
		echo "yay not found, installing yay..."
		sudo pacman -S --needed base-devel git --noconfirm
		git clone https://aur.archlinux.org/yay.git
		cd yay
		makepkg -si --noconfirm
		cd ..
		rm -rf yay
	else
		echo "yay is already installed."
	fi

	# Install yay packages
	if [ -f yay_packages.txt ]; then
		echo "Installing yay packages..."
		yay -S --needed - <yay_packages.txt
	else
		echo "yay_packages.txt not found!"
	fi

	# Install homebrew if not installed
	if ! command -v brew &>/dev/null; then
		echo "Homebrew not found, installing Homebrew..."
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	else
		echo "Homebrew is already installed."
	fi

	# Install brew package
	if [ -f brew_package.txt]; then
		echo "Installing brew packages..."
		xargs brew install <brew_packages.txt
	else
		echo "brew_packages.txt not found!"
	fi

	echo "All packages installed successfully."
}
if gum confirm "DO YOU WANT TO START THE INSTALLATION OF THE WARMDEV DOTFILES NOW?"; then
	echo "Installation started."
	package_install
elif [ $? -eq 130 ]; then
	echo ":: Installation canceled."
	exit 130
else
	echo ":: Installation canceled."
	exit
fi
