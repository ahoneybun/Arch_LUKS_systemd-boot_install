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

sudo pacman -S --needed firefox thunderbird tilix, fish, flatpak, telegram-desktop, discord

echo ""
echo "- Setting up Yubikey Support"
echo ""

echo 'KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0664", GROUP="users", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="f1d0"' | sudo tee /etc/udev/rules.d/10-security-key.rules
sudo pacman -S libu2f-host
sudo systemctl enable pcscd

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

echo ""
echo "- Downloading Pop Shell Shortcuts"
echo ""

git clone https://aur.archlinux.org/pop-shell-shortcuts-git

echo ""
echo "- Building Pop Shell Shortcuts"
echo ""

cd pop-shell-shortcuts-git
makepkg -srcif
cd ..

echo ""
echo "- Downloading Pop Shell"
echo ""

git clone https://github.com/pop-os/shell.git

echo ""
echo "= Building Pop Shell"
echo ""

cd shell
make local-install
cd ..

echo ""
echo "- Rebooting the system as needed for Yubikey Support"
echo ""

sudo systemctl reboot