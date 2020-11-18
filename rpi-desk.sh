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

function budgieMENU() {
	until [ "$exitstatus" = "1" ]; do
		whiptail --clear --title "rpi-desk" --checklist "Select packages:" --cancel-button "Back" --notags --separate-output 25 75 15 \
			"a" " Desktop" ON \
			"b" " GNOME Terminal " ON \
			"c" " Some Panel Plugins " ON \
			"d" " Some Nautilus Plugins " ON \
			"e" " gedit Text Editor " ON \
			"f" " Some gedit Plugins " ON \
			"g" " Evince Document Viewer " ON \
			"i" " Eye of GNOMEImage Viewer " ON \
			"j" " Evolution E-Mail and Calendar " OFF \
			"k" " GNOME System Monitor " ON 2>results
			exitstatus=$?
		while read choice
		do
			case $choice in
				a ) sudo apt-get -y install budgie-desktop alacarte nautilus gnome-tweak-tool file-roller lightdm lightdm-gtk-greeter-settings gvfs-backends gvfs-fuse gnome-system-tools ;;
				b ) sudo apt-get -y install gnome-terminal ;;
				c ) sudo apt-get -y install budgie-app-launcher-applet budgie-appmenu-applet budgie-hotcorners-applet budgie-showtime-applet ;;
				d ) sudo apt-get -y install nautilus-admin nautilus-extension-gnome-terminal nautilus-gtkhash nautilus-hide nautilus-scripts-manager ;;
				e ) sudo apt-get -y install gedit ;;
				f ) sudo apt-get -y install gedit-plugin-bracket-completion gedit-plugin-character-map gedit-plugin-code-comment gedit-plugin-find-in-files gedit-plugin-terminal ;;
				g ) sudo apt-get -y install evince ;;
				i ) sudo apt-get -y install eog eog-plugin-fit-to-width eog-plugin-fullscreen-background eog-plugin-hide-titlebar eog-plugin-slideshow-shuffle ;;
				j ) sudo apt-get -y install evolution ;;
				k ) sudo apt-get -y install gnome-system-monitor ;;
			esac
		done < results
		rm -fr results
	done
	unset exitstatus
}

function mateMENU() {
	until [ "$exitstatus" = "1" ]; do
		whiptail --clear --title "rpi-desk" --checklist "Select packages:" --cancel-button "Back" --notags --separate-output 25 75 15 \
			"a" " Desktop" ON \
			"b" " MATE Terminal " ON \
			"c" " Some Panel Plugins " ON \
			"d" " Some Caja Plugins " ON \
			"e" " Pluma Text Editor " ON \
			"f" " Atril Document Viewer " ON \
			"g" " Eye of MATE Image Viewer " ON \
			"h" " MATE Power Manager " ON 2>results
			exitstatus=$?
		while read choice
		do
			case $choice in
				a ) sudo apt-get -y install --no-install-recommends mate-desktop-environment-core mate-themes mate-session-manager xinit mate-applets xserver-xorg --install-recommends mate-desktop mozo lightdm lightdm-gtk-greeter-settings engrampa mate-media mate-menu mate-screensaver mate-tweak gvfs-backends gvfs-fuse gnome-system-tools ;;
				b ) sudo apt-get -y install --no-install-recommends mate-terminal ;;
				c ) sudo apt-get -y install mate-applet-appmenu mate-applet-brisk-menu mate-window-buttons-applet mate-window-menu-applet ;;
				d ) sudo apt-get -y install caja-admin caja-gtkhash caja-open-terminal caja-wallpaper ;;
				e ) sudo apt-get -y install --no-install-recommends pluma ;;
				f ) sudo apt-get -y install atril ;;
				g ) sudo apt-get -y install eom ;;
				h ) sudo apt-get -y install mate-power-manager ;;
			esac
		done < results
		rm -fr results
	done
	unset exitstatus
}

function xfceMENU() {
	until [ "$exitstatus" = "1" ]; do
		whiptail --clear --title "rpi-desk" --checklist "Select packages:" --cancel-button "Back" --notags --separate-output 25 75 15 \
			"a" " Desktop" ON \
			"b" " XFCE Terminal " ON \
			"c" " Some Panel Plugins " ON \
			"d" " Some Thunar Plugins " ON \
			"e" " Mousepad Text Editor " ON \
			"f" " Evince Document Viewer " ON \
			"g" " Ristretto Image Viewer " ON \
			"h" " Pragha Music Player " OFF \
			"i" " Parole Media Player " OFF \
			"j" " Orage Calendar " OFF \
			"k" " XFCE Notes" OFF \
			"l" " XFCE Power Manager " ON \
			"m" " XFCE Taskmanager " ON 2>results
			exitstatus=$?
		while read choice
		do
			case $choice in
				a ) clear ; sudo apt-get -y install --no-install-recommends xserver-xorg --install-recommends xfce4 menulibre lightdm lightdm-gtk-greeter-settings gvfs-backends gvfs-fuse gnome-system-tools ;;
				b ) clear ; sudo apt-get -y install xfce4-terminal ;;
				c ) clear ; sudo apt-get -y install xfce4-appmenu-plugin xfce4-datetime-plugin xfce4-netload-plugin xfce4-places-plugin xfce4-sensors-plugin xfce4-systemload-plugin xfce4-whiskermenu-plugin ;;
				d ) clear ; sudo apt-get -y install thunar-archive-plugin thunar-gtkhash thunar-media-tags-plugin ;;
				e ) clear ; sudo apt-get -y install mousepad ;;
				f ) clear ; sudo apt-get -y install evince ;;
				g ) clear ; sudo apt-get -y install ristretto ;;
				h ) clear ; sudo apt-get -y install pragha ;;
				i ) clear ; sudo apt-get -y install parole ;;
				j ) clear ; sudo apt-get -y install orage ;;
				k ) clear ; sudo apt-get -y install xfce4-notes ;;
				l ) clear ; sudo apt-get -y install xfce4-power-manager ;;
				m ) clear ; sudo apt-get -y install xfce4-taskmanager ;;
			esac
		done < results
		rm -fr results
	done
	unset exitstatus
}

function option_3() {
	until [ "$exitstatus" = "1" ]; do
		menu3=$(whiptail --clear --title "rpi-desk" --menu "Choose an option:" --cancel-button "Back" --notags 25 75 10 \
			"1" "BUDGIE desktop" \
			"2" "MATE desktop" \
			"3" "XFCE desktop" 3>&1 1>&2 2>&3
		)
		exitstatus=$?
		case $menu3 in
				1 ) clear ; budgieMENU ;;
				2 ) clear ; mateMENU ;;
				3 ) clear ; xfceMENU ;;
		esac
	done
	unset exitstatus
}

function option_4() {
	until [ "$exitstatus" = "1" ]; do
		SOFTWARE=$(whiptail --clear --title "rpi-desk" --checklist "Select packages:" --cancel-button "Back" 25 75 18 \
			"chromium-browser" " Webbrowser " ON \
			"claws-mail" " E-Mail Client " OFF \
			"doublecmd-gtk" " File manager with two panels " OFF \
			"ffmpeg" " Multimedia Tools " ON \
			"geany" " Programmer's text editor " ON \
			"geany-plugins" " Set of plugins for Geany " ON \
			"gimp" " Image editor " ON \
			"git" " Version control system " OFF \
			"guake" " Top-down terminal " ON \
			"materia-gtk-theme" " Material Design theme " ON \
			"openjdk-8-jre" " OpenJDK 8 Java runtime " OFF \
			"openshot" " Video Editor " OFF \
			"rhythmbox" " Music player with Podcast support " OFF \
			"synapse" " Graphical launcher " ON \
			"synaptic" " Package manager " ON \
			"vlc" " Multimedia player " ON \
			"xrdp" " Remote desktop server " OFF 3>&1 1>&2 2>&3
		)
		exitstatus=$?
		if [ "$exitstatus" = "0" ]; then
			SOFTPACKS=$( echo "$SOFTWARE" | tr -d '"' )
			sudo apt-get -y install $SOFTPACKS
		fi
	done
	unset exitstatus
}

function checkzip() {
	if ! dpkg -s unzip >/dev/null 2>&1; then
		sudo apt-get -y install unzip
	fi
	cd ~
}

function geanycolors() {
	if ! dpkg -s geany >/dev/null 2>&1; then
		sudo apt-get -y install geany
	fi
	wget https://github.com/geany/geany-themes/archive/master.zip
	unzip master.zip
	rm -f master.zip
	sudo mv geany-themes-master/colorschemes/* /usr/share/geany/colorschemes/
	rm -fr geany-themes-master
}

function photogimp() {
	if ! dpkg -s gimp >/dev/null 2>&1; then
		sudo apt-get -y install gimp
	fi
	wget https://github.com/Diolinux/PhotoGIMP/archive/master.zip
	unzip master.zip
	rm -f master.zip
	mv PhotoGIMP-master/.var/app/org.gimp.GIMP/config/GIMP/ /home/$(whoami)/.config/GIMP/
	rm -fr PhotoGIMP-master
}

function rhythmtray() {
	if ! dpkg -s rhythmbox >/dev/null 2>&1; then
		sudo apt-get -y install rhythmbox
	fi
	wget https://github.com/mendhak/rhythmbox-tray-icon/raw/master/rhythmbox-tray-icon.zip
	sudo unzip -o rhythmbox-tray-icon.zip -d /usr/lib/rhythmbox/plugins/
	rm -f rhythmbox-tray-icon.zip
}

function rpidesksplash() {
	if [ -d "/usr/share/themes/rpidesk/" ]; then
		sudo rm -rf /usr/share/themes/rpidesk/
	fi
	sudo mkdir -p /usr/share/themes/rpidesk/balou
	xtheme="/usr/share/themes/rpidesk/balou/themerc"
	sudo touch $xtheme
	sudo chmod 666 $xtheme
	echo "[Info]" >> $xtheme
	echo "Name=rpi-desk" >> $xtheme
	echo "Description=rpi-desk Splashscreen" >> $xtheme
	echo "[Splash Screen]" >> $xtheme
	echo "bgcolor=#303030:#303030" >> $xtheme
	echo "fgcolor=#ffffff" >> $xtheme
	echo "logo=logo" >> $xtheme
}

function option_5() {
	until [ "$exitstatus" = "1" ]; do
		whiptail --clear --title "rpi-desk" --checklist "Select packages:" --cancel-button "Back" --notags --separate-output 25 75 10 \
			"1" " Extra Geany Color Schemes " ON \
			"2" " PhotoGIMP (User folder) " ON \
			"3" " Suru++ Asprómauros Icons " ON \
			"4" " Rhythmbox Tray Icon " ON \
			"5" " Xfce Dark splashscreen " OFF 2>results
			exitstatus=$?
		while read choice
		do
			case $choice in
				1 ) clear ; checkzip ; geanycolors ;;
				2 ) clear ; checkzip ; photogimp ;;
				3 ) clear ; wget -qO- https://raw.githubusercontent.com/gusbemacbe/suru-plus-aspromauros/master/install.sh | sh ;;
				4 ) clear ; checkzip ; rhythmtray ;;
				5 ) clear ; rpidesksplash ;;
			esac
		done < results
		rm -fr results
	done
	unset exitstatus
}

function fixXRDP() {
	if test -f "/etc/xrdp/xrdp.ini"; then
		sudo sed -i 's/allow_channels=true/allow_channels=false/g' /etc/xrdp/xrdp.ini
	fi
}

function option_6() {
	until [ "$exitstatus" = "1" ]; do
		menu7=$(whiptail --clear --title "rpi-desk" --menu "Choose an option:" --cancel-button "Back" --notags 25 75 10 \
			"1" "Set ROOT password" \
			"2" "Disable XRDP Thinclient Drives" 3>&1 1>&2 2>&3
		)
		exitstatus=$?
		case $menu7 in
				1 ) clear ; sudo passwd ; enter ;;
				2 ) clear ; fixXRDP ; enter ;;
		esac
	done
	unset exitstatus
}

function enter() {
	echo -n $'\n    	Press Enter to continue '
	read
	clear
}

function mainMENU() {
	until [ "$exitstatus" = "1" ]; do
		menu0=$(whiptail --clear --title "rpi-desk" --menu "Choose an option:" --cancel-button "Exit" --notags 25 75 10 \
			"1" "Start Raspi-Config" \
			"2" "Start Update" \
			"3" "Select Desktop Environment" \
			"4" "Select Additional Software" \
			"5" "Select Unofficial Software" \
			"6" "Various Settings" \
			"7" "Reboot" 3>&1 1>&2 2>&3
		)
		exitstatus=$?
		case $menu0 in
			1 ) clear ; sudo raspi-config ;;
			2 ) clear ; sudo apt-get update ; sudo apt-get -y upgrade ; enter ;;
			3 ) clear ; option_3 ;;
			4 ) clear ; option_4 ;;
			5 ) clear ; option_5 ;;
			6 ) clear ; option_6 ;;
			7 ) clear ; sudo reboot ;;
		esac
	done
	unset exitstatus
}
mainMENU
