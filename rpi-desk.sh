#!/bin/bash

export NEWT_COLORS='
root=white,black
border=white,black
window=white,black
title=white,black
textbox=white,black
compactbutton=lightgray,black
listbox=white,black
actlistbox=lightgray,black
actsellistbox=black,lightgray
checkbox=white,black
actcheckbox=black,lightgray
'

function installMATE() {
    sudo apt -y install --no-install-recommends mate-desktop-environment-core mate-themes mate-session-manager xinit mate-terminal mate-applets pluma xserver-xorg --install-recommends mate-desktop caja-admin caja-gtkhash caja-open-terminal caja-wallpaper atril engrampa eom mozo mate-applet-appmenu mate-applet-brisk-menu mate-media mate-menu mate-power-manager mate-screensaver mate-tweak mate-utils mate-window-buttons-applet mate-window-menu-applet gnome-system-tools lightdm lightdm-gtk-greeter-settings synaptic gvfs-backends gvfs-fuse
	sudo apt clean
}

function installXFCE() {
    sudo apt -y install --no-install-recommends xserver-xorg --install-recommends xfce4 xfce4-terminal lightdm lightdm-gtk-greeter-settings xfce4-datetime-plugin xfce4-netload-plugin xfce4-taskmanager xfce4-appmenu-plugin xfce4-power-manager thunar-archive-plugin thunar-gtkhash evince menulibre mousepad pragha ristretto synaptic gvfs-backends gvfs-fuse
	sudo apt clean
}

function deskMenu() {
    DESKTOP=$(whiptail --clear --title "Desktop Environment" --radiolist "Choose desktop:" --cancel-button "Back" --notags 20 60 8 \
		"lxde" " LXDE desktop " OFF \
		"mate" " MATE desktop " OFF \
		"xfce" " XFCE desktop " ON 3>&1 1>&2 2>&3
    )
	case $DESKTOP in
		lxde)
			whiptail --title "Error!" --msgbox "This feature is not implemented yet. Hit OK to continue." 8 60
			advancedMenu
		;;
		mate)
			installMATE
			advancedMenu
		;;
		xfce)
			installXFCE
			advancedMenu
		;;
	esac
		advancedMenu
}

function softMenu() {
    SOFTWARE=$(whiptail --clear --title "Additional Software" --checklist "Select packages:" --cancel-button "Back" 15 60 10 \
		"chromium-browser" " Webbrowser " ON \
		"claws-mail" " eMail Client " ON \
		"doublecmd-gtk" " File manager with two panels " OFF \
		"geany" " Programmer's text editor " ON \
		"gimp" " Image editor " ON \
		"git" " Version control system " OFF \
		"guake" " Top-down terminal " ON \
		"synapse" " Graphical launcher " ON \
		"vlc" " Multimedia player " ON \
		"xrdp" " Remote desktop server " OFF 3>&1 1>&2 2>&3
    )
    exitstatus=$?
    if [ $exitstatus = 0 ]; then
        SOFTPACKS=$( echo "$SOFTWARE" | tr -d '"' )
		sudo apt-get -y install $SOFTPACKS
		advancedMenu
    else
		advancedMenu
    fi
}

function styleMenu() {
    whiptail --clear --title "Appearance Packages" --checklist "Select packages:" --cancel-button "Back" --notags --separate-output 20 60 8 \
		"materia" " materia-gtk-theme " ON \
		"suru" " Suru++ Asprómauros Icons " ON 2>results

    while read choice
	do
		case $choice in
                materia) 
                sudo apt -y install materia-gtk-theme
                ;;
                suru)
                wget -qO- https://raw.githubusercontent.com/gusbemacbe/suru-plus-aspromauros/master/install.sh | sh
                ;;
        esac
	done < results
	rm results
	advancedMenu
}

function advancedMenu() {
	ADVSEL=$(whiptail --clear --title "rpi-desk" --menu "Choose an option:" --cancel-button "Exit" --notags 15 60 6 \
		"1" "Start Raspi-Config" \
		"2" "Start Update" \
		"3" "Select Desktop Environment" \
		"4" "Select Additional Software" \
		"5" "Select Appearance Packages" \
		"6" "Reboot" 3>&1 1>&2 2>&3
	)
	case $ADVSEL in
		1)
			sudo raspi-config
			advancedMenu
		;;
		2)
			sudo apt update && sudo apt -y upgrade
			advancedMenu
		;;
		3) deskMenu
		;;
		4) softMenu
		;;
		5) styleMenu
		;;
		6)
			sudo reboot
		;;
	esac
}
advancedMenu
exit
