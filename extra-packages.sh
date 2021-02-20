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
echo "- Installing Firefox, Thunderbird, Tilix, Fish, Flatpak, Telegram"
echo ""

sudo pacman -S --needed firefox thunderbird tilix, fish, flatpak, telegram-desktop

echo ""
echo "- Installing development packages"
echo ""

sudo pacman -S --needed neofetch rust tree rygel typescript

echo ""
echo "- Downloading Pika Backup from AUR"
echo ""

git clone https://aur.archlinux.org/pika-backup.git

echo ""
echo "- Building Pika Backup"
echo ""

cd pika-backup
makepkg -srcif
cd ..

echo ""
echo "- Downloading Visual Studio Code from AUR"
echo ""

git clone https://aur.archlinux.org/visual-studio-code-bin

echo ""
echo "- Building Visual Studio Code"
echo ""

cd visual-studio-code-bin
makepkg -srcif
cd ..
