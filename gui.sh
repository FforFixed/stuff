#!/usr/bin/env bash

apt update -y
apt upgrade -y

apt install sudo -y

sudo apt update -y 
sudo apt update -y

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