#!/bin/bash

currentPath="$(pwd)"

echo "Do you want to init for root?"
select yn in "Yes" "No" "Cancel"; do
	case $yn in
	Yes)
		echo "Initializing for root and $USER"
		sudo rm -rf /root/.vimrc
		sudo ln -s "$currentPath"/vimrc /root/.vimrc
		break
		;;
	No)
		echo "Initializing for $USER"
		break
		;;
	Cancel)
		echo "No config was changed!"
		exit
		;;
	esac
done

rm -rf ~/.vimrc
ln -s "$currentPath"/.vimrc ~/.vimrc

rm -rf ~/.ideavimrc
ln -s "$currentPath"/.ideavimrc ~/.ideavimrc
