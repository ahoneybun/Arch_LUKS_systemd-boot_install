## Install GNOME and set it up

```
pacman -S gnome gnome-software-packagekit-plugin
systemctl enable gdm
```

## Install Plasma and set it up

```
pacman -S plasma-meta plasma-desktop plasma-wayland-session
systemctl enable sddm
```
