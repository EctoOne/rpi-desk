#!/bin/bash

#### Menu Colors
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

#### General functions
function do_error() {
	whiptail --msgbox "There was an error! Please try again." 7 75 0
}
function do_success() {
	whiptail --msgbox "Operation successful." 7 75 0
}
function do_exit() {
	whiptail --yesno "Would you like to reboot now?" 7 75 0
	if [ $? -eq 0 ]; then
		sudo sync && sudo reboot
	fi
	exit 0
}

function budgieMENU() {
	until [ "$exitstatus" = "1" ]; do
		cmd=(whiptail --clear --title "rpi-desk" --checklist "Select packages:" --ok-button "Select" --cancel-button "Back" --notags --separate-output 25 75 15)
			options=("a" " Desktop" ON \
			"b" " GNOME Terminal " ON \
			"c" " Some Panel Plugins " ON \
			"d" " Some Nautilus Plugins " ON \
			"e" " gedit Text Editor " ON \
			"f" " Some gedit Plugins " ON \
			"g" " Evince Document Viewer " ON \
			"i" " Eye of GNOMEImage Viewer " ON \
			"j" " Evolution E-Mail and Calendar " OFF \
			"k" " GNOME System Monitor " ON
			)
			exitstatus=$?
		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		clear
		for choice in $choices
		do
			case $choice in
				a ) clear ; exitstatus=1 ; sudo apt -y install budgie-desktop alacarte nautilus gnome-tweak-tool file-roller lightdm lightdm-gtk-greeter-settings gvfs-backends gvfs-fuse gnome-system-tools || do_error ;;
				b ) clear ; exitstatus=1 ; sudo apt -y install gnome-terminal || do_error ;;
				c ) clear ; exitstatus=1 ; sudo apt -y install budgie-app-launcher-applet budgie-appmenu-applet budgie-hotcorners-applet budgie-showtime-applet || do_error ;;
				d ) clear ; exitstatus=1 ; sudo apt -y install nautilus-admin nautilus-extension-gnome-terminal nautilus-gtkhash nautilus-hide nautilus-scripts-manager || do_error ;;
				e ) clear ; exitstatus=1 ; sudo apt -y install gedit || do_error ;;
				f ) clear ; exitstatus=1 ; sudo apt -y install gedit-plugin-bracket-completion gedit-plugin-character-map gedit-plugin-code-comment gedit-plugin-find-in-files gedit-plugin-terminal || do_error ;;
				g ) clear ; exitstatus=1 ; sudo apt -y install evince || do_error ;;
				i ) clear ; exitstatus=1 ; sudo apt -y install eog eog-plugin-fit-to-width eog-plugin-fullscreen-background eog-plugin-hide-titlebar eog-plugin-slideshow-shuffle || do_error ;;
				j ) clear ; exitstatus=1 ; sudo apt -y install evolution || do_error ;;
				k ) clear ; exitstatus=1 ; sudo apt -y install gnome-system-monitor || do_error ;;
			esac
		done
		exitstatus=1
	done
	unset exitstatus
}

function mateMENU() {
	until [ "$exitstatus" = "1" ]; do
		cmd=(whiptail --clear --title "rpi-desk" --checklist "Select packages:" --ok-button "Select" --cancel-button "Back" --notags --separate-output 25 75 15)
			options=("a" " Desktop" ON
			"b" " MATE Terminal " ON
			"c" " Some Panel Plugins " ON
			"d" " Some Caja Plugins " ON
			"e" " Pluma Text Editor " ON
			"f" " Atril Document Viewer " ON
			"g" " Eye of MATE Image Viewer " ON
			"h" " MATE Power Manager " ON
			)
			exitstatus=$?
		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		clear
		for choice in $choices
		do
			case $choice in
				a ) clear ; exitstatus=1 ; sudo apt -y install --no-install-recommends mate-desktop-environment-core mate-themes mate-session-manager xinit mate-applets xserver-xorg --install-recommends mate-desktop mozo lightdm lightdm-gtk-greeter-settings engrampa mate-media mate-menu mate-screensaver mate-tweak gvfs-backends gvfs-fuse gnome-system-tools || do_error ;;
				b ) clear ; exitstatus=1 ; sudo apt -y install --no-install-recommends mate-terminal || do_error ;;
				c ) clear ; exitstatus=1 ; sudo apt -y install mate-applet-appmenu mate-applet-brisk-menu mate-window-buttons-applet mate-window-menu-applet || do_error ;;
				d ) clear ; exitstatus=1 ; sudo apt -y install caja-admin caja-gtkhash caja-open-terminal caja-wallpaper || do_error ;;
				e ) clear ; exitstatus=1 ; sudo apt -y install --no-install-recommends pluma || do_error ;;
				f ) clear ; exitstatus=1 ; sudo apt -y install atril || do_error ;;
				g ) clear ; exitstatus=1 ; sudo apt -y install eom || do_error ;;
				h ) clear ; exitstatus=1 ; sudo apt -y install mate-power-manager || do_error ;;
			esac
		done
		exitstatus=1
	done
	unset exitstatus
}

function xfceMENU() {
	until [ "$exitstatus" = "1" ]; do
		cmd=(whiptail --clear --title "rpi-desk" --checklist "Select packages:" --ok-button "Select" --cancel-button "Back" --notags --separate-output 25 75 15)
			options=("a" " Desktop" ON
			"b" " XFCE Terminal " ON
			"c" " Some Panel Plugins " ON
			"d" " Some Thunar Plugins " ON
			"e" " Mousepad Text Editor " ON
			"f" " Evince Document Viewer " ON
			"g" " Ristretto Image Viewer " ON
			"h" " Pragha Music Player " OFF
			"i" " Parole Media Player " OFF
			"j" " Orage Calendar " OFF
			"k" " XFCE Notes" OFF
			"l" " XFCE Power Manager " ON
			"m" " XFCE Taskmanager " ON
			"o" " Seahorse (Passwords and Keys) " ON
			)
			exitstatus=$?
		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		clear
		for choice in $choices
		do
			case $choice in
				a ) clear ; exitstatus=1 ; sudo apt -y install --no-install-recommends xserver-xorg --install-recommends xfce4 menulibre lightdm lightdm-gtk-greeter-settings gvfs-backends gvfs-fuse gnome-system-tools || do_error ;;
				b ) clear ; exitstatus=1 ; sudo apt -y install xfce4-terminal || do_error ;;
				c ) clear ; exitstatus=1 ; sudo apt -y install xfce4-appmenu-plugin xfce4-datetime-plugin xfce4-netload-plugin xfce4-places-plugin xfce4-sensors-plugin xfce4-systemload-plugin xfce4-whiskermenu-plugin || do_error ;;
				d ) clear ; exitstatus=1 ; sudo apt -y install thunar-archive-plugin thunar-gtkhash thunar-media-tags-plugin || do_error ;;
				e ) clear ; exitstatus=1 ; sudo apt -y install mousepad || do_error ;;
				f ) clear ; exitstatus=1 ; sudo apt -y install evince || do_error ;;
				g ) clear ; exitstatus=1 ; sudo apt -y install ristretto || do_error ;;
				h ) clear ; exitstatus=1 ; sudo apt -y install pragha || do_error ;;
				i ) clear ; exitstatus=1 ; sudo apt -y install parole || do_error ;;
				j ) clear ; exitstatus=1 ; sudo apt -y install orage || do_error ;;
				k ) clear ; exitstatus=1 ; sudo apt -y install xfce4-notes || do_error ;;
				l ) clear ; exitstatus=1 ; sudo apt -y install xfce4-power-manager || do_error ;;
				m ) clear ; exitstatus=1 ; sudo apt -y install xfce4-taskmanager || do_error ;;
				o ) clear ; exitstatus=1 ; sudo apt -y install seahorse || do_error ;;
			esac
		done
		exitstatus=1
	done
	unset exitstatus
}

function option_3() {
	until [ "$exitstatus" = "1" ]; do
		menu3=$(whiptail --clear --title "rpi-desk" --menu "Choose an option:" --ok-button "Select" --cancel-button "Back" --notags 25 75 10 \
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
		SOFTWARE=$(whiptail --clear --title "rpi-desk" --checklist "Select packages:" --ok-button "Select" --cancel-button "Back" 25 75 20 \
			"bleachbit" " System cleaner " OFF \
			"chromium-browser" " Webbrowser " ON \
			"claws-mail" " E-Mail Client " OFF \
			"doublecmd-gtk" " File manager with two panels " OFF \
			"ffmpeg" " Multimedia Tools " ON \
			"geany" " Programmer's text editor " ON \
			"geany-plugins" " Set of plugins for Geany " ON \
			"gimp" " Image editor " ON \
			"git" " Version control system " ON \
			"guake" " Top-down terminal " OFF \
			"handbrake" " Video encoder " OFF \
			"keepassxc" " Password Manager " OFF \
			"materia-gtk-theme" " Material Design theme " ON \
			"openjdk-8-jre" " OpenJDK 8 Java runtime " OFF \
			"openshot" " Video Editor " OFF \
			"rhythmbox" " Music player with Podcast support " OFF \
			"soundconverter" " Simple audio converter " OFF \
			"synapse" " Graphical launcher " OFF \
			"synaptic" " Package manager " ON \
			"vlc" " Multimedia player " ON \
			"xrdp" " Remote desktop server " OFF 3>&1 1>&2 2>&3
		)
		exitstatus=$?
		if [ "$exitstatus" = "0" ]; then
			SOFTPACKS=$( echo "$SOFTWARE" | tr -d '"' )
			sudo apt -y install $SOFTPACKS || do_error
		fi
	done
	unset exitstatus
}

function checkzip() {
	if ! dpkg -s unzip >/dev/null 2>&1; then
		sudo apt -y install unzip
	fi
	cd ~
}

function geanycolors() {
	if ! dpkg -s geany >/dev/null 2>&1; then
		sudo apt -y install geany
	fi
	wget https://github.com/geany/geany-themes/archive/master.zip && unzip master.zip || do_error
	rm -f master.zip
	sudo mv geany-themes-master/colorschemes/* /usr/share/geany/colorschemes/ && rm -fr geany-themes-master
}

function photogimp() {
	if ! dpkg -s gimp >/dev/null 2>&1; then
		sudo apt -y install gimp
	fi
	wget https://github.com/Diolinux/PhotoGIMP/archive/master.zip && unzip master.zip || do_error
	rm -f master.zip
	mkdir -p .config && mv PhotoGIMP-master/.var/app/org.gimp.GIMP/config/GIMP/ /home/$(whoami)/.config/GIMP/
	rm -fr PhotoGIMP-master
}

function rhythmtray() {
	if ! dpkg -s rhythmbox >/dev/null 2>&1; then
		sudo apt -y install rhythmbox
	fi
	wget https://github.com/mendhak/rhythmbox-tray-icon/raw/master/rhythmbox-tray-icon.zip && sudo unzip -o rhythmbox-tray-icon.zip -d /usr/lib/rhythmbox/plugins/ || do_error
	rm -f rhythmbox-tray-icon.zip
}

function tmm3() {
	if ! dpkg -s libmediainfo0v5 >/dev/null 2>&1; then
		sudo apt -y install libmediainfo0v5
	fi
	cd ~
	mkdir -p apps && cd apps/ && mkdir -p tmm3
	wget https://release.tinymediamanager.org/v3/dist/tmm_3.1.11_linux.tar.gz && tar xvzf tmm_3.1.11_linux.tar.gz -C tmm3 || do_error
	rm -f tmm_3.1.11_linux.tar.gz
}

function vscodei() {
	wget https://aka.ms/linux-armhf-deb && sudo dpkg -i linux-armhf-deb || do_error
	sudo sed -i 's/arch=amd64,arm64,armhf/arch=armhf/g' /etc/apt/sources.list.d/vscode.list
	rm -f linux-armhf-deb
}

function xfcedark() {
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
		cmd=(whiptail --clear --title "rpi-desk" --checklist "Select packages:" --ok-button "Select" --cancel-button "Back" --notags --separate-output 25 75 10)
			options=("1" " Extra Geany Color Schemes " ON
			"2" " PhotoGIMP (User folder) " ON
			"3" " Suru++ Asprómauros Icons " ON
			"4" " Rhythmbox Tray Icon " ON
			"5" " tinyMediaManager3 " OFF
			"6" " Visual Studio Code " OFF
			"7" " Xfce Dark splashscreen " OFF
			)
			exitstatus=$?
		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		clear
		for choice in $choices
		do
			case $choice in
				1 ) clear ; exitstatus=1 ; checkzip ; geanycolors || do_error ;;
				2 ) clear ; exitstatus=1 ; checkzip ; photogimp || do_error ;;
				3 ) clear ; exitstatus=1 ; wget -qO- https://raw.githubusercontent.com/gusbemacbe/suru-plus-aspromauros/master/install.sh | sh || do_error ;;
				4 ) clear ; exitstatus=1 ; checkzip ; rhythmtray || do_error ;;
				5 ) clear ; exitstatus=1 ; tmm3 || do_error ;;
				6 ) clear ; exitstatus=1 ; vscodei || do_error ;;
				7 ) clear ; exitstatus=1 ; xfcedark || do_error ;;
			esac
		done
		exitstatus=1
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
		menu7=$(whiptail --clear --title "rpi-desk" --menu "Choose an option:" --ok-button "Select" --cancel-button "Back" --notags 25 75 10 \
			"1" "Set ROOT password" \
			"2" "Disable XRDP Thinclient Drives" 3>&1 1>&2 2>&3
		)
		exitstatus=$?
		case $menu7 in
				1 ) clear ; sudo passwd && do_success || do_error ;;
				2 ) clear ; fixXRDP && do_success || do_error ;;
		esac
	done
	unset exitstatus
}

function fileMENU() {
	until [ "$exitstatus" = "1" ]; do
		let i=0
		W=()
		while read -r line; do
			let i=$i+1
			W+=($i "$line")
		done < <( ls -1 scripts/ )
		FILE=$(whiptail --clear --title "rpi-desk" --menu "Choose an option:" --ok-button "Select" --cancel-button "Exit" --notags 25 75 10 "${W[@]}" 3>&2 2>&1 1>&3)
		exitstatus=$?
		if [ "$exitstatus" = "0" ]; then
			SCRIPT=$( readlink -f $(ls -1 scripts/ | sed -n "`echo "$FILE p" | sed 's/ //'`") )
			bash scripts/$(basename $SCRIPT)
		fi
	done
	unset exitstatus
}

function mainMENU() {
	until [ "$exitstatus" = "1" ]; do
		menu0=$(whiptail --clear --title "rpi-desk" --menu "Choose an option:" --ok-button "Select" --cancel-button "Exit" --notags 25 75 10 \
			"1" "Start Update" \
			"2" "Start Raspi-Config" \
			"3" "Select Desktop Environment" \
			"4" "Select Additional Software" \
			"5" "Select Unofficial Software" \
			"6" "Various Settings" \
			"7" "Reboot" 3>&1 1>&2 2>&3
		)
		exitstatus=$?
		case $menu0 in
			1 ) clear ; sudo apt update && sudo apt -y upgrade || do_error ;;
			2 ) clear ; sudo raspi-config ;;
			3 ) clear ; option_3 ;;
			4 ) clear ; option_4 ;;
			5 ) clear ; option_5 ;;
			6 ) clear ; option_6 ;;
			7 ) clear ; do_exit ;;
		esac
	done
	unset exitstatus
}

function startMENU() {
	until [ "$exitstatus" = "1" ]; do
		menu0=$(whiptail --clear --title "rpi-desk" --menu "Choose an option:" --ok-button "Select" --cancel-button "Exit" --notags 25 75 10 \
			"1" "Main Menu" \
			"2" "Extra Scripts" 3>&1 1>&2 2>&3
		)
		exitstatus=$?
		case $menu0 in
			1 ) clear ; mainMENU || do_error ;;
			2 ) clear ; fileMENU || do_error ;;
		esac
	done
	unset exitstatus
}

DIR="scripts/"
if [ -d "$DIR" ]; then
	startMENU
else
	mainMENU
fi
