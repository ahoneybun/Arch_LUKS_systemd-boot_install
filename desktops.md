# Install GNOME and set it up

```
pacman -S gnome gnome-software-packagekit-plugin
systemctl enable gdm
```

# Install Plasma and set it up

```
pacman -S plasma-meta plasma-desktop plasma-wayland-session
systemctl enable sddm
```

# Install Sway and set it up

```
pacman -S sway bemenu
mkdir ~/.config/sway
cp /etc/sway/config ~/.config/sway/config
```

## Configure bemenu

```
nano ~/.config/sway/config
```

and add change the `set dmenu` line to have `bemenu-run` instead then save and exit.
