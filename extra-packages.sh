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

sudo pacman -S noto-fonts-cjk noto-fonts-emoji noto-fonts

echo ""
echo "- Installing build deps for Pika Backup"
echo ""

sudo pacman -S meson python-llfuse borg

echo ""
echo "- Downloading Pika Backup from AUR"
echo ""

wget https://aur.archlinux.org/cgit/aur.git/snapshot/pika-backup.tar.gz
tar -xf pika-backup.tar.gz

cd pika-backup
makepkg -ic
cd ..

