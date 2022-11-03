#!/bin/bash

while true;do
	read -p "Do you want to install the xiera basic? [(y)es/(n)o] " yn
		case $yn in [Yy]* ) make install; break;;
		[Nn]* ) exit;; * ) echo "Please answer [y]es or [n]o.";;
	esac
 done

echo "Hello, who am I talking to?"
echo "please input username" 
read name
echo "It's nice to meet you $name"

sleep 5

echo "updateing"

apt update -y
apt upgrade -y

apt install sudo -y

sudo apt update -y 
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



