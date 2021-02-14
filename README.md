# Arch-LUKS-systemd-boot-install
Config file and steps to install Arch encrypted with systemd-boot

## Boot from Live Disk

### Connect to the network

```
iwctl
station device connect SSID
```

This command will list the network device:

```
device list
```

#### Test the connection

```
ping -c 3 www.google.com
```

### Set the system clock

```
timedatectl set-ntp true
```

### Partition the disk

```
cfdisk /dev/***
```

| Mount Point | Partition  | Type       | Size                |
|:-----------:|:----------:|:----------:|:-------------------:|
| /mnt/boot   | /dev/***p1 | EFI System | 1GB                 |
| /mnt        | /dev/***p2 | Linux      | Left over           |
| [SWAP]      | /dev/***p3 | Linux swap | 8GB (x2 Hibernation |

**NOTE:**
p1-3 is an example of using an M.2 NVMe drive. You can replace it with partition names like sda1 or sdb1 depending on your setup in the commands below.

### Setting up LUKS Encryption

Loading the kernel modules:

```
modprobe dm-crypt
modprobe dm-mod
```

Encrypting the partition:

```
cryptsetup luksFormat -v -s 512 -h sha512 /dev/***p2
```

You will need to enter the passphrase two times to confirm the passphrase. The command will complete with the following line:

Command successful

Next we'll open the partition to install Arch:

```
cryptsetup luksOpen /dev/***p2 crypt_root
```

Now the partition will be at the following location:

```
ls /dev/mapper/
```

### Format the partitions

```
mkfs.fat -F32 /dev/***p1
mkfs.ext4 /dev/***p2
mkswap /dev/***p3
```

### Mount the partitions

```
mount /dev/mapper/crypt_root /mnt
swapon /dev/***p3
```

### Install Arch

```
pacstrap /mnt base base-devel linux linux-headers linux-firmware
```

### FStab 

```
genfsab -U /mnt >> /mnt/etc/fstab
```

### Chroot

```
arch-chroot /mnt
```

### Setting the Time Zone

```
ln -sf /usr/share/zoneinfo/America/Denver /etc/localtime
```

```
hwclock --systohc
```

### Localization

Edit the `/etc/locale.gen` and uncomment `en_US.UTF-8 UTF-8` then generate the locales:

```
locale-gen
```

Create the `/etc/locale.conf` with this content:

```
LANG=en_US.UTF-8
```

Setting hosts (`/etc/hosts`) and hostname (`/etc/hostname`) files:

```
myhostname
```

```
127.0.0.1   localhost
::1         localhost
127.0.0.1   myhostname.localdomain myhostname
```

### InitramFS

```
mkinitcpio -P
```

Copy the kernel files:

```
cp initramfs-linux.img / 
cp initramfs-linux-fallback.img / 
cp vmlinuz-linux /
```

Mount the Boot partition:

```
mount /dev/***p1 /boot
bootctl install
cp initramfs-linux.img /boot
cp initramfs-linux-fallback.img /boot
cp vmlinuz-linux /boot
bootctl update
pacman -S nano
nano /boot/loader/entries/arch.conf
```

Now we'll place these lines in the `arch.conf` file:

```
title Arch Linux
linux /vmlinuz-linux
initrd /initramfs-linux.img
options cryptdevice=/dev/nvme0n1p2:crypt_root root=/dev/mapper/crypt_root quiet rw
```

**NOTE:**
Be sure to replace the cryptdevice partition name with your own.

### Root password

```
passwd
```

### Install needed packages for LUKS to work

```
pacman -S lvm2
```

# Sources used
- https://linuxhint.com/setup-luks-encryption-on-arch-linux/
- https://gist.github.com/OdinsPlasmaRifle/e16700b83624ff44316f87d9cdbb5c94
