#!/bin/bash

# Intro
# ---

clear
echo "-------------------------------------"
echo "| Welcome to version 0.2 of the EPI |"
echo "-------------------------------------"
sleep 2
clear

echo ""
echo "- Installing Noto Font bundles (helpful for Spot[ify] songs with foreign letters)"
echo ""

sudo pacman -S --needed noto-fonts-cjk noto-fonts-emoji noto-fonts

echo ""
echo "- Installing Firefox, Thunderbird, Tilix, Fish, Flatpak, Telegram, Discord"
echo ""

sudo pacman -S --needed firefox thunderbird tilix fish flatpak 

echo ""
echo "- Setting up Yubikey Support"
echo ""

echo 'KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0664", GROUP="users", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="f1d0"' | sudo tee /etc/udev/rules.d/10-security-key.rules
sudo pacman -S libu2f-host
sudo systemctl enable pcscd

echo ""
echo "- Installing development packages"
echo ""

sudo pacman -S --needed neofetch rust tree rygel typescript make

echo ""
echo "- Rebooting the system as needed for Yubikey Support"
echo ""

sudo systemctl reboot
