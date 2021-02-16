#!/bin/bash

# Intro
# ---

clear
echo "---------------------------------------------"
echo "Welcome to version 0.2 of the SSI"
echo "---------------------------------------------"
sleep 2
clear

clear
echo "---------------------------------------------"
echo "Installing dependencies"
echo "---------------------------------------------"
sleep 2
clear

sudo pacman -S base-devel git dfu-programmer efibootmgr rust typescript dmidecode dkms linux-headers at python-cffi python-distro python-evdev python-pynacl python-systemd python-xlib wget

clear
echo "----------------------------------------------------------------"
echo "Downloading, building and installing System76 Firmware Daemon"
echo "----------------------------------------------------------------"
sleep 2
clear

echo "Downloading from the AUR"

wget https://aur.archlinux.org/cgit/aur.git/snapshot/system76-firmware-daemon.tar.gz
tar -xf system76-firmware-daemon.tar.gz

echo "Entering the directory and building"

cd system76-firmware-daemon
makepkg -i
 
echo "Enabling and starting services"

sudo systemctl enable system76-firmware-daemon
sudo systemctl start system76-firmware-daemon

clear
echo "----------------------------------------------------------------"
echo "Downloading, building and installing System76 Firmware Daemon"
echo "----------------------------------------------------------------"
sleep 2
clear

echo "Downloading from the AUR"

wget https://aur.archlinux.org/cgit/aur.git/snapshot/firmware-manager.tar.gz
tar -xf firmware-manager.tar.gz

echo "Entering the directory and building"

cd firmware-manager
makepkg -i

echo "Adding user to adm group"

sudo gpasswd -a $USER adm

# Clean up
# ---

# rm -r system76-firmware-daemon*