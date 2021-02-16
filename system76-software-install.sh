#!/bin/bash

# Intro
# ---

clear
echo "-------------------------------------"
echo "| Welcome to version 0.2 of the SSI |"
echo "-------------------------------------"
sleep 2
clear

clear
echo "---------------------------"
echo "| Installing dependencies |"
echo "---------------------------"
sleep 2

sudo pacman -S base-devel git dfu-programmer efibootmgr rust typescript dmidecode dkms linux-headers at python-cffi python-distro python-evdev python-pynacl python-systemd python-xlib wget

clear
echo "----------------------------"
echo "| System76 Firmware Daemon" |
echo "----------------------------"
sleep 2

echo ""
echo "- Downloading from the AUR"
echo ""

wget https://aur.archlinux.org/cgit/aur.git/snapshot/system76-firmware-daemon.tar.gz
tar -xf system76-firmware-daemon.tar.gz

echo ""
echo "- Entering the directory and building"
echo ""

cd system76-firmware-daemon
makepkg -i
cd ..
 
echo ""
echo "- Enabling and starting services"
echo ""

sudo systemctl enable system76-firmware-daemon
sudo systemctl start system76-firmware-daemon

sleep 5

clear
echo "-----------------------------"
echo "| System76 Firmware Manager |"
echo "-----------------------------"
sleep 2

echo ""
echo "- Downloading from the AUR"
echo ""

wget https://aur.archlinux.org/cgit/aur.git/snapshot/firmware-manager.tar.gz
tar -xf firmware-manager.tar.gz

echo ""
echo "- Entering the directory and building"
echo ""

cd firmware-manager
makepkg -i
cd ..

echo ""
echo "- Adding user to adm group"
echo ""

sudo gpasswd -a $USER adm

sleep 5

clear
echo "-------------------------"
echo "| System76 DKMS package |"
echo "-------------------------"
sleep 2

echo ""
echo "- Downloading from the AUR"
echo ""

wget https://aur.archlinux.org/cgit/aur.git/snapshot/system76-dkms.tar.gz
tar -xf system76-dkms.tar.gz

echo ""
echo "- Entering the directory and building"
echo ""

cd system76-dkms
makepkg -i
cd ..

sleep 5

clear
echo "--------------------------"
echo "| System76 Power package |"
echo "--------------------------"
sleep 2

echo ""
echo "- Downloading from the AUR"
echo ""

wget https://aur.archlinux.org/cgit/aur.git/snapshot/system76-power.tar.gz
tar -xf system76-power.tar.gz

echo ""
echo "- Entering the directory and building"
echo ""

cd system76-power
makepkg -i
cd ..

echo ""
echo "- Enabling and starting services"
echo ""

sudo systemctl enable system76-power
sudo systenctl start system76-power

sleep 5

clear
echo "---------------------------------------="
echo "| System76 Power GNOME Shell Extension |"
echo "----------------------------------------"
sleep 2

echo ""
echo "- Downloading from the AUR"
echo ""

wget wget https://aur.archlinux.org/cgit/aur.git/snapshot/gnome-shell-extension-system76-power.tar.gz
tar -xf gnome-shell-extension-system76-power.tar.gz

echo ""
echo "- Entering the directory and building"
echo ""

cd gnome-shell-extension-system76-power
makepkg -i
cd ..

sleep 5

clear
echo "---------------------------"
echo "| System76 Driver package |"                                      
echo "---------------------------"
sleep 2

echo ""
echo "- Downloading from the AUR"
echo ""

wget wget https://aur.archlinux.org/cgit/aur.git/snapshot/system76-driver.tar.gz
tar -xf system76-driver.tar.gz

echo ""
echo "- Entering the directory and building"
echo ""

cd system76-driver
makepkg -i
cd ..

echo ""
echo "- Enabling and starting services"
echo ""

sudo systemctl enable system76
sudo systemctl start system76

sleep 5

clear
echo "-------------------------"
echo "| System76 ACPI package |"
echo "-------------------------"
sleep 2

echo ""
echo "- Downloading from the AUR"
echo ""

wget wget https://aur.archlinux.org/cgit/aur.git/snapshot/system76-acpi-dkms.tar.gz
tar -xf system76-acpi-dkms.tar.gz

echo ""
echo "- Entering the directory and building"
echo ""

cd system76-acpi-dkms
makepkg -i
cd ..

sleep 5

clear
echo "----------------------------"
echo "| Is this a Thelio system? |"
echo "| - Yes                    |"
echo "| - No                     |"
echo "----------------------------"

echo -n ": "; read thelio
case "$thelio" in

Yes) wget wget https://aur.archlinux.org/cgit/aur.git/snapshot/system76-io-dkms.tar.gz
   tar -xf system76-io-dkms.tar.gz
   cd system76-io-dkms
   makepkg -i
   cd ..
   ;;
No) break

esac

clear
echo "---------------------------------------------"
echo "| Is this an Adder WS (addw1/addw2) system? |"
echo "| - Yes                                     |"
echo "| - No                                      |"
echo "---------------------------------------------"

echo -n ": "; read addw
case "$addw" in

Yes) wget wget https://aur.archlinux.org/cgit/aur.git/snapshot/system76-oled.tar.gz
   tar -xf system76-oled.tar.gz
   cd system76-oled
   makepkg -i
   cd ..
   ;;
No) exit 1

esac

# Clean up
# ---

# rm -r system76-firmware-daemon*