# Tested on the following systems 
- Base Manjaro GNOME install     
- Base Arch GNOME install         

# Packages needed:

Using the AUR for system76 packages:

```
sudo pacman -S base-devel git dfu-programmer efibootmgr rust typescript dmidecode dkms linux-headers at python-cffi python-distro python-evdev python-pynacl python-systemd python-xlib
```

---
**NOTE**
  For Manjaro make sure to match with the kernel version. Current Manjaro uses the 5.9 kernel so use #8. You can use this command to find the kernel version:

```
uname -a
```

---

---
**NOTE**
For any GNOME Shell extensions to show up in the Extensions application you will need to log out and back in.
---

## Build and Install system76-firmware-daemon

### Download PKGBUILD package and untar it

```
wget https://aur.archlinux.org/cgit/aur.git/snapshot/system76-firmware-daemon.tar.gz
tar -xf system76-firmware-daemon.tar.gz
```

### Run this command:

```
cd system76-firmware-daemon
makepkg -i
```
 
### Now to enable and start the service:

```
sudo systemctl enable system76-firmware-daemon
sudo systemctl start system76-firmware-daemon
```

## Build and Install firmware-manager

### Download PKGBUILD package and untar it

```
wget https://aur.archlinux.org/cgit/aur.git/snapshot/firmware-manager.tar.gz
tar -xf firmware-manager.tar.gz
```

### Run these commands:

```
cd firmware-manager
makepkg -i
```

The Firmware Manager may need to be ran as root or with sudo to work correctly. You can add your user to the adm group to use the tool without sudo:

```
sudo gpasswd -a $USER adm
```

---

These packages need to be installed in this order for them to complete their build and install processes.

## Build and Install system76-dkms

### Download PKGBUILD package and untar it

```
wget https://aur.archlinux.org/cgit/aur.git/snapshot/system76-dkms.tar.gz
tar -xf system76-dkms.tar.gz
```

### Run this command:

```
cd system76-dkms
makepkg -i
```

## Build and Install system76-power

### Download PKGBUILD package and untar it

```
wget https://aur.archlinux.org/cgit/aur.git/snapshot/system76-power.tar.gz
tar -xf system76-power.tar.gz
```

### Run this command:

```
cd system76-power
makepkg -i
sudo systemctl enable system76-power
sudo systenctl start system76-power
```

---
**NOTE**

 If you are using a NVIDIA graphics card, you may need to add additional
    X11 config to make the GPU switching work, see below:

        https://wiki.archlinux.org/index.php/NVIDIA_Optimus#Use_NVIDIA_graphics_only
---

## Build and Install gnome-shell-extension-system76-power

### Download PKGBUILD package and untar it

```
wget wget https://aur.archlinux.org/cgit/aur.git/snapshot/gnome-shell-extension-system76-power.tar.gz
tar -xf gnome-shell-extension-system76-power.tar.gz
```

### Run this command:

```
cd gnome-shell-extension-system76-power
makepkg -i
```

## Build and Install system76-driver

---
**NOTE**
The AUR version is out of date.
---

### Download PKGBUILD package and untar it

```
wget wget https://aur.archlinux.org/cgit/aur.git/snapshot/system76-driver.tar.gz
tar -xf system76-driver.tar.gz
```

### Run this command:

```
cd system76-driver
makepkg -i
sudo systemctl enable system76
sudo systemctl start system76
```

## Build and Install system76-io-dkms 
(this is only needed for the Thelio Io board)

### Download PKGBUILD package and untar it

```
wget wget https://aur.archlinux.org/cgit/aur.git/snapshot/system76-io-dkms.tar.gz
tar -xf system76-io-dkms.tar.gz
```

### Run this command:

```
cd system76-io-dkms
makepkg -i
```

## Build and Install system76-acpi-dkms

### Download PKGBUILD package and untar it

```
wget wget https://aur.archlinux.org/cgit/aur.git/snapshot/system76-acpi-dkms.tar.gz
tar -xf system76-acpi-dkms
```

### Run this command:

```
cd system76-acpi-dkms
makepkg -i
```

## Build and Install system76-oled 
(this is only needed for systems with OLED panels like the addw1/addw2)

### Download PKGBUILD package and untar it

```
wget wget https://aur.archlinux.org/cgit/aur.git/snapshot/system76-oled.tar.gz
tar -xf system76-oled.tar.gz
```

### Run this command:

```
cd system76-acpi-oled
makepkg -i
```
