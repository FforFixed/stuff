#!/usr/bin/env bash

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



