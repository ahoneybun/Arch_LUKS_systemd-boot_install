#!/bin/bash

# Intro
# ---

clear
echo "-----------------------------------------------"
echo "| Welcome to version 0.2 of the Popify Script |"
echo "-----------------------------------------------"
sleep 2
clear

echo "---------------------------"
echo "| Installing dependencies |"
echo "---------------------------"
sleep 2

sudo pacman -S --needed base-devel git meson sassc gnome-icon-theme 

echo "-----------------"
echo "| Pop GTK Theme |"
echo "-----------------"
sleep 2

echo ""
echo "- Downloading from the AUR"
echo ""

git clone https://aur.archlinux.org/pop-gtk-theme.git

echo ""
echo "- Entering the directory and building"
echo ""

cd pop-gtk-theme
makepkg -si
cd ..

sleep 5

echo "--------------------"
echo "| Roboto Slab Font |"
echo "--------------------"
sleep 2

echo ""
echo "- Downloading from the AUR"
echo ""

git clone https://aur.archlinux.org/ttf-roboto-slab.git

echo ""
echo "- Entering the directory and building"
echo ""

cd ttf-roboto-slab
makepkg -si
cd ..

sleep 5

echo "-------------"
echo "| Pop Fonts |"
echo "-------------"
sleep 2

echo ""
echo "- Downloading from the AUR"
echo ""

git clone https://aur.archlinux.org/pop-fonts.git

echo ""
echo "- Entering the directory and building"
echo ""

cd pop-fonts
makepkg -si   
cd ..

sleep 5

echo "------------------"
echo "| Pop Icon Theme |"
echo "------------------"       
sleep 2

echo ""
echo "- Downloading from the AUR"
echo ""

git clone https://aur.archlinux.org/pop-icon-theme.git      

echo ""
echo "- Entering the directory and building"
echo ""

cd pop-icon-theme
makepkg -si
cd ..

sleep 5

echo "-------------"
echo "| Pop Theme |"
echo "-------------"       
sleep 2

echo ""
echo "- Downloading from the AUR"
echo ""

git clone https://aur.archlinux.org/pop-theme.git      

echo ""
echo "- Entering the directory and building"
echo ""

cd pop-theme
makepkg -si
cd ..

sleep 5

echo "--------------------"
echo " Setting shortcuts  |"
echo "--------------------"

gsettings set org.gnome.desktop.wm.keybindings close ['<Super>q']
gsettings set org.gnome.desktop.wm.keybindings
gsettings set org.gnome.desktop.wm.keybindings 

echo "--------------------"
echo " Setting theming   |"
echo "--------------------"

gsettings set org.gnome.desktop.interface cursor-theme "Pop"
gsettings set org.gnome.desktop.interface gtk-theme "Pop-dark"
gsettings set org.gnome.desktop.interface icon-theme "Pop"
gsettings set org.gnome.desktop.interface font-name "Fira Sans Semi-Light 10"

# Clean up
# ---

 sudo rm -r pop-theme*
 sudo rm -r pop-gtk-theme*
 sudo rm -r pop-icon-theme*
 sudo rm -r pop-fonts*
 sudo rm -r ttf-roboto-slab*
