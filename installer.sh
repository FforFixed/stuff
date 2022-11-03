#!/usr/bin/env bash

CHOICE=($(whiptail --title "SELECT PACKAGES TO INSTALL" --checklist \
"List of packages" 20 100 10 \
"BYOB" "browser" OFF \
"pip3" "Python package manager" OFF \
"ksnip" "Screenshot tool" OFF \
"virtualbox" "virtualization software" ON 3>&1 1>&2 2>&3))


if [ -z "$CHOICE" ]; then
  echo "No option was selected (user hit Cancel or unselected all options)"
else
  for CHOICE in $CHOICES; do
    case "$CHOICE" in
    "BYOB")
      echo "Option 1 was selected"
      ;;
    "Nextcloud")
      echo "Option 2 was selected"
      ;;
    "openssh")
      echo "Option 3 was selected"
      ;;
    "Phoneinfoga")
      echo "Option 4 was selected"
      ;;
    *)
      echo "Unsupported item $CHOICE!" >&2
      exit 1
      ;;
    esac
  done
fi



CHOICE=($(whiptail --title "Pakage installer" --checklist \
"Select pakages" 20 78 4 \
"BYOB" "botnet" ON \
"Nextcloud" "cloud" OFF \
"openssh" "SSH server/client" OFF \
"Phoneinfoga" "Phone tracker" OFF 3>&1 1>&2 2>&3))