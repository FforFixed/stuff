#!/usr/bin/env bash

while true;do
	read -p "Do you wish to install PHONEINFOGA? [(y)es/(n)o] " yn
		case $yn in [Yy]* ) break;;
		[Nn]* ) exit;; * ) echo "Please answer [y]es or [n]o.";;
	esac
 done

#https://github.com/sundowndev/PhoneInfoga

echo "updateing"

sleep 2

apt update -y
apt upgrade -y

apt install sudo

sudo apt update -y
sudo apt upgrade -y

echo "done"

echo "installing PHONEINFOGA"
sudo apt install curl -y

sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

echo "pulling from docker"

docker pull sundowndev/phoneinfoga:latest


read -p "[A]Do you want to run in terminal or [B] do you want to run via local website?"
        read AB

case $AB in 
	A ) echo runing via terminal;
		echo "please enter the phonenumber"
        read phone

        docker run -it sundowndev/phoneinfoga scan -n $phone;;
	B ) docker run it p 8080.8080 sundowndev/phoneinfoga serve -p 8080;;
	* ) echo invalid response;
		exit 1;;
esac