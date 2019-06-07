#!/bin/bash
# macOS Sierra TFTP Server Creator
# Author Mertcan GÖKGÖZ - 07.05.2017 15:00 (GMT +3)
#
# Requirements
#	- Macos Sierra 10.12.4 and later
#	- 'homebrew' package manager
#	- brew install dialog
#
# How to use
# 1- Start Terminal via spotlight
# 2- Change the file permission "chmod +x tftpServer.sh"
# 3- Choose the options
# 4- Enjoy!
#
# Added comment
# 
# Added second comment
#

while true;
do
	HEIGHT=15
	WIDTH=40
	CHOICE_HEIGHT=10
	BACKTITLE="macOS Sierra TFTP Server Creator"
	TITLE="TFTP Connector"
	MENU="choose one of the following options:"

	OPTIONS=(1 "Start TFTP Server"
			2 "Stop TFTP Server"
			3 "Open TFTP Directory"
			4 "Check TFTP Status"
			5 "Exit")

	CHOICE=$(dialog --clear \
			--backtitle "$BACKTITLE" \
			--title "$TITLE" \
			--menu "$MENU" \
			$HEIGHT $WIDTH $CHOICE_HEIGHT \
			"${OPTIONS[@]}" \
			2>&1 >/dev/tty)

	clear

	case $CHOICE in 
		1)
			echo "Starting TFTP Server"
			sleep 1
			sudo launchctl load -F /System/Library/LaunchDaemons/tftp.plist
			sudo launchctl start com.apple.tftpd
			echo "Started TFTP Server"
			;;
		2)
			echo "Stopping TFTP Server"
			sleep 2
			sudo launchctl unload -F /System/Library/LaunchDaemons/tftp.plist
			sudo launchctl stop com.apple.tftpd
			sleep 3
			echo "Stopped TFTP Server"
			;;
		3)
			echo "Opening TFTP File Directory"
			sleep 1
			open /private/tftpboot/
			echo "Opened TFTP File Directory"
			;;
		4)
			echo "Status"
			netstat -na | grep \*.69
			;;
		5)  
			echo "Exiting"
			break
			;;
		*) invalid options
			;;
	esac
	sleep 1
done
