wallpaper() {
	read -p "Do you want to install wallpaper repo? (y/n): " choice
	case "$choice" in
	y | Y)
		mkdir /home/$USER/Downloads/wallpaper
		git clone https://github.com/warmdev17/main-dots ~/Downloads/wallpaper
		;;
	n | N) echo "Wallpaper repo is not install" ;;
	*)
		echo "Invalid choice. Please enter 'y' or 'n'."
		wallpaper
		;;
	esac
}
