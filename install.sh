#!/bin/sh
#
# The Oni install script
# Copyright (c) 2015 Robert Calvert <http://robert.calvert.io>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>


############################################
# Set variables
############################################

SCRIPT_DIR=$(readlink -f $(dirname $0))

############################################
# Show the welcome message
############################################
clear
echo ""
echo " _____     _ "
echo "|     |___|_|"
echo "|  |  |   | |"
echo "|_____|_|_|_| "
echo ""
echo "My Openbox Network Install script for Debian."
echo ""

############################################
# Confirm before running the install
############################################
read -r -p "Run the install now? [y/N] " rINSTALL
case $rINSTALL in
    [yY][eE][sS]|[yY])
    
        ############################################
		# Update the repositories
		############################################
		clear
		echo "Updating repositories..."
		echo ""
		sleep 1s
		sudo apt-get update
		echo ""
		echo "DONE"
		echo ""
		sleep 2s

		############################################
		# Perform Dist Upgrade
		############################################
		clear
		echo "Performing dist upgrade..."
		echo ""
		sleep 1s
		sudo apt-get dist-upgrade
		echo ""
		echo "DONE"
		echo ""
		sleep 2s

		############################################
		# Install Desktop
		############################################
		clear
		echo "Installing Desktop packages..."
		echo ""
		sleep 1s
		sudo apt-get install xorg openbox lxpanel tint2
		echo ""
		echo "DONE"
		echo ""
		sleep 2s
		
		
		############################################
		# Install Core packages
		############################################
		clear
		echo "Installing Core packages..."
		echo ""
		sleep 1s
		sudo apt-get install synaptic terminator thunar thunar-volman thunar-archive-plugin xarchiver gdebi geany galculator gimp catfish parcellite lxtask
		echo ""
		echo "DONE"
		echo ""
		sleep 2s
		
		############################################
		# Install Media packages
		############################################
		clear
		echo "Installing Media packages..."
		echo ""
		sleep 1s
		sudo apt-get install alsa-base gstreamer0.10-alsa volumeicon-alsa xfce4-mixer vlc audacious
		echo ""
		echo "DONE"
		echo ""
		sleep 2s
		
		############################################
		# Install Network packages
		############################################
		clear
		echo "Installing Network packages..."
		echo ""
		sleep 1s
		sudo apt-get install network-manager-gnome chromium filezilla
		echo ""
		echo "DONE"
		echo ""
		sleep 2s
		
		############################################
		# Install Theme packages
		############################################
		clear
		echo "Installing Theme packages..."
		echo ""
		sleep 1s
		sudo apt-get install lxappearance nitrogen   
		echo ""
		echo "DONE"
		echo ""
		sleep 2s

		############################################
		# Perform autoremove
		############################################
		clear
		echo "Performing autoremove..."
		echo ""
		sleep 1s
		sudo apt-get autoremove
		echo ""
		echo "DONE"
		echo ""
		sleep 2s

		############################################
		# Perform clean
		############################################
		clear
		echo "Performing clean..."
		echo ""
		sleep 1s
		sudo apt-get clean
		echo ""
		echo "DONE"
		echo ""
		sleep 2s

		############################################
		# Apply the home configurations
		############################################
		clear
		echo "Applying home configurations..."
		echo ""
		sleep 1s
		cp -R $SCRIPT_DIR/cfg/home/. /home/$USER/
		echo ""
		echo "DONE"
		echo ""
		sleep 2s
		
		############################################
		# Apply the system configurations
		############################################
		clear
		echo "Applying system configurations..."
		echo ""
		sleep 1s
		sudo cp -R $SCRIPT_DIR/cfg/etc/. /etc/
		echo ""
		echo "DONE"
		echo ""
		sleep 2s

		############################################
		# Show the done message
		############################################
		clear
		echo "Install complete..."
		echo ""

		############################################
		# Prompt for reboot
		############################################
		read -r -p "Reboot the system now? [y/N] " rREBOOT
		case $rREBOOT in
			[yY][eE][sS]|[yY])
				sudo reboot
				exit
			;;

		*)
			exit
			;;

		esac
        ;;

	[nN][oO]|[nN])

		############################################
		# Exit the install
		############################################
		exit
		;;

    *)

		############################################
		# Loop back into the install
		############################################
		$0
        ;;

esac
