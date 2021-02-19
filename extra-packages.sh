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
echo "- Downloading Pika Backup from AUR"
echo ""

git clone https://aur.archlinux.org/pika-backup.git

cd pika-backup
makepkg -srcif
cd ..

