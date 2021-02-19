# Tested on the following systems 
- Base Manjaro GNOME install     
- Base Arch GNOME install         

# Packages needed:

Using the AUR for system76 packages:

```
sudo pacman -S --needed base-devel git linux-headers
```

---
**NOTE**
  For Manjaro make sure to match with the kernel version. Manjaro offers several kernels including the latest stable and LTS versions. You can use this command to find the kernel version:

```
uname -r
```

For any GNOME Shell extensions to show up in the Extensions application you will need to log out and back in.

## Build and Install system76-firmware

### Download PKGBUILD:

```
git clone https://aur.archlinux.org/system76-firmware.git
```

### Run these commands:

```
cd system76-firmware-daemon
makepkg -srcif
```
 
### Now to enable and start the service:

```
sudo systemctl enable --now system76-firmware-daemon
```

## Build and Install firmware-manager

### Download PKGBUILD:

```
git clone https://aur.archlinux.org/firmware-manager.git
```

### Run these commands:

```
cd firmware-manager
makepkg -srcif
```

---

These packages need to be installed in this order for them to complete their build and install processes.

## Build and Install system76-dkms

### Download PKGBUILD:

```
git clone https://aur.archlinux.org/system76-dkms.git
```

### Run these commands:

```
cd system76-dkms
makepkg -srcif
```

## Build and Install system76-power

### Download PKGBUILD:

```
git clone https://aur.archlinux.org/system76-power.git
```

### Run these commands:

```
cd system76-power
makepkg -srcif
sudo systemctl enable --now system76-power
```

**NOTE**

 If you are using a NVIDIA graphics card, you may need to add additional
    X11 config to make the GPU switching work, see below:

        https://wiki.archlinux.org/index.php/NVIDIA_Optimus#Use_NVIDIA_graphics_only

## Build and Install gnome-shell-extension-system76-power

### Download PKGBUILD:

```
git clone https://aur.archlinux.org/gnome-shell-extension-system76-power-git.git
```

### Run these commands:

```
cd gnome-shell-extension-system76-power
makepkg -srcif
```

## Build and Install system76-driver

**NOTE**
The package is currently is out of date.

### Download PKGBUILD:

```
git clone https://aur.archlinux.org/system76-driver.git
```

### Run these command:

```
cd system76-driver
makepkg -srcif
sudo systemctl enable --now system76
```

## Build and Install system76-io-dkms 
(this is only needed for the Thelio Io board)

### Download PKGBUILD:

```
git clone https://aur.archlinux.org/system76-io-dkms.git
```

### Run these commands:

```
cd system76-io-dkms
makepkg -srcif
```

## Build and Install system76-acpi-dkms

### Download PKGBUILD:

```
git clone https://aur.archlinux.org/system76-acpi-dkms.git
```

### Run these commands:

```
cd system76-acpi-dkms
makepkg -srcif
```

## Build and Install system76-oled 
(this is only needed for systems with OLED panels like the addw1/addw2)

### Download PKGBUILD:

```
git clone https://aur.archlinux.org/system76-oled.git
```

### Run these commands:

```
cd system76-acpi-oled
makepkg -srcif
```
