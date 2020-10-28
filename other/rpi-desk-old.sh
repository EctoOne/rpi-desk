#!/bin/bash

trap '' 2 # ignore control + c
while true
do
	clear # clear screen for each loop of menu
	echo "================="
	echo "Menu ---"
	echo  "================="
	echo "--- Update"
	echo "	Enter 1 to Update the System"
	echo "--- XFCE4"
	echo "	Enter 2 to install a basic XFCE4 desktop"
	echo "--- Additional Software"
	echo "	Enter 3 to install Additional Software"
	echo "--- Dark Theme"
	echo "	Enter 4 to install dark theme packages"
	echo "--- Reboot"
	echo "	Enter r to reboot "
	echo "--- Quit"
	echo "	Enter q to quit the script"
	echo ""
	echo -e "Enter your selection here and hit <return>"
	echo ""
	read answer # create variable to retains the answer
		case "$answer" in
		1) sudo apt -y update && sudo apt -y upgrade && sudo apt -y dist-upgrade && sudo apt clean ;;
		2) sudo apt -y install --no-install-recommends xserver-xorg
            	   sudo apt -y install xfce4 xfce4-terminal lightdm lightdm-gtk-greeter-settings xfce4-datetime-plugin xfce4-netload-plugin xfce4-taskmanager xfce4-appmenu-plugin xfce4-power-manager thunar-archive-plugin thunar-gtkhash evince menulibre mousepad pragha ristretto synaptic gvfs-backends gvfs-fuse
		   sudo apt clean ;;
		3) sudo apt -y install chromium-browser claws-mail doublecmd-gtk geany gimp guake synapse vlc
		   sudo apt clean ;;
		4) sudo apt -y install materia-gtk-theme
		   sudo apt clean
		   wget -qO- https://raw.githubusercontent.com/gusbemacbe/suru-plus-aspromauros/master/install.sh | sh ;;
		r) sudo reboot ;;
		q) exit ;;
		esac
			echo ""
			echo -e "Hit the <return> key to continue"
			read input ##This causes a pause before the loop clears the screen
done
