#!/usr/bin/env bash

apt update -y
apt upgrade -y

apt install sudo -y

sudo apt update -y 
sudo apt upgrade -y

sudo apt install whiptail -y

whiptail --textbox --scrolltext installer.txt 10 80

whiptail --title "CONFIRMATION" --yesno "Should I proceed" 8 78 
if [[ $? -eq 0 ]]; then 
  whiptail --title "MESSAGE" --msgbox "Download will start." 8 78 
  chmod u+x setup_installer.sh
  ./setup_installer.sh 
elif [[ $? -eq 1 ]]; then 
  whiptail --title "MESSAGE" --msgbox "Cancelling Process since user pressed <NO>." 8 78 
elif [[ $? -eq 255 ]]; then 
  whiptail --title "MESSAGE" --msgbox "User pressed ESC. Exiting the script" 8 78 
fi 

usrname=$(whiptail --title "Create New User" --inputbox "Username to be created" 8 40 3>&1 1>&2 2>&3)

echo $usrname

sleep 5

echo "updateing"

apt update -y
apt upgrade -y

apt install sudo -y

sudo apt update -y i
sudo apt update -y

read -p "Do you want to install byob? [yes/no]" yn

case $yn in 
	yes ) echo byob will be installed;
		chmod u+x byob.sh
		./byob.sh;;
	no ) ;;
	* ) echo invalid response;
		exit 1;;
esac

read -p "Do you want to install PHONEINFOGIA? [yes/no]" yn

case $yn in 
	yes ) echo isntalling...;
		chmod u+x phoneinfoga.sh
		./phoneinfoga.sh;;
	no ) ;;
	* ) echo invalid response;
		exit 1;;
esac



