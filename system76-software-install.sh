#!/bin/bash

# Intro
# ---

clear
echo "-------------------------------------"
echo "| Welcome to version 0.2 of the SSI |"
echo "-------------------------------------"
sleep 2
clear

echo "---------------------------"
echo "| Installing dependencies |"
echo "---------------------------"
sleep 2

sudo pacman -S --needed base-devel git linux-headers

echo "----------------------------"
echo "| System76 Firmware |"
echo "----------------------------"
sleep 2

echo ""
echo "- Downloading from the AUR"
echo ""

git clone https://aur.archlinux.org/system76-firmware.git

echo ""
echo "- Entering the directory and building"
echo ""

cd system76-firmware
makepkg -srcif
cd ..

echo ""
echo "- Enabling and starting services"
echo ""

sudo systemctl enable --now system76-firmware-daemon

sleep 5

echo "-----------------------------"
echo "| System76 Firmware Manager |"
echo "-----------------------------"
sleep 2

echo ""
echo "- Downloading from the AUR"
echo ""

git clone https://aur.archlinux.org/firmware-manager.git

echo ""
echo "- Entering the directory and building"
echo ""

cd firmware-manager
makepkg -srcif
cd ..

sleep 5

echo "-------------------------"
echo "| System76 DKMS package |"
echo "-------------------------"
sleep 2

echo ""
echo "- Downloading from the AUR"
echo ""

git clone https://aur.archlinux.org/system76-dkms.git

echo ""
echo "- Entering the directory and building"
echo ""

cd system76-dkms
makepkg -srcif
cd ..

sleep 5

echo "--------------------------"
echo "| System76 Power package |"
echo "--------------------------"
sleep 2

echo ""
echo "- Downloading from the AUR"
echo ""

git clone https://aur.archlinux.org/system76-power.git

echo ""
echo "- Entering the directory and building"
echo ""

cd system76-power
makepkg -srcif
cd ..

echo ""
echo "- Enabling and starting services"
echo ""

sudo systemctl enable --now system76-power

sleep 5

echo "----------------------------------------"
echo "| System76 Power GNOME Shell Extension |"
echo "----------------------------------------"
sleep 2

echo ""
echo "- Downloading from the AUR"
echo ""

git clone https://aur.archlinux.org/gnome-shell-extension-system76-power-git.git

echo ""
echo "- Entering the directory and building"
echo ""

cd gnome-shell-extension-system76-power-git
makepkg -srcif
cd ..

sleep 5

echo "---------------------------"
echo "| System76 Driver package |"
echo "---------------------------"
sleep 2

echo ""
echo "- Downloading from the AUR"
echo ""

git clone https://aur.archlinux.org/system76-driver.git

echo ""
echo "- Entering the directory and building"
echo ""

cd system76-driver
makepkg -srcif
cd ..

echo ""
echo "- Enabling and starting services"
echo ""

sudo systemctl enable --now system76

sleep 5

echo "-------------------------"
echo "| System76 ACPI package |"
echo "-------------------------"
sleep 2

echo ""
echo "- Downloading from the AUR"
echo ""

git clone https://aur.archlinux.org/system76-acpi-dkms.git

echo ""
echo "- Entering the directory and building"
echo ""

cd system76-acpi-dkms
makepkg -srcif
cd ..

sleep 5

echo "----------------------------"
echo "| Is this a Thelio system? |"
echo "| - Yes                    |"
echo "| - No                     |"
echo "----------------------------"

echo -n ": "; read thelio
case "$thelio" in

Yes) git clone https://aur.archlinux.org/system76-io-dkms.git
   cd system76-io-dkms
   makepkg -srcif
   cd ..
   ;;
No) break

esac

echo "---------------------------------------------"
echo "| Is this an Adder WS (addw1/addw2) system? |"
echo "| - Yes                                     |"
echo "| - No                                      |"
echo "---------------------------------------------"

echo -n ": "; read addw
case "$addw" in

Yes) git clone https://aur.archlinux.org/system76-oled.git
   cd system76-oled
   makepkg -srcif
   cd ..
   ;;
No) exit 1

esac

# Clean up
# ---

 sudo rm -r system76-firmware*
 sudo rm -r firmware-manager*
 sudo rm -r system76-dkms*
 sudo rm -r system76-power*
 sudo rm -r gnome-shell-extension-system76-power-git*
 sudo rm -r system76-driver*
 sudo rm -r system76-acpi-dkms*
 sudo rm -r system76-io-dkms*
 sudo rm -r system76-oled*
