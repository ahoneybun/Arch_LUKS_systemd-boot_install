# Disclaimer

This work is all community work and none of it has been tested by System76 QA or Engineering. This is not officially supported by the System76 Happiness Team (Tech Support). YMMV as always. 

There is a bash script to auto-magically install the System76 Drivers on Arch-based systems after you are finished installing the OS can be found here: 

https://github.com/ahoneybun/Install-Other-System76/blob/main/Arch-based/install-software.sh

## Arch-LUKS-systemd-boot-install
Config files and steps to install Arch encrypted LUKS and systemd-boot as the bootloader.

This is the end partition layout using the steps below:

```nvme0n1        259:0    0 465.8G  0 disk  
├─nvme0n1p1    259:1    0     1G  0 part  /boot
├─nvme0n1p2    259:2    0   457G  0 part  
│ └─crypt_root 254:0    0   457G  0 crypt /
└─nvme0n1p3    259:3    0   7.8G  0 part  [SWAP]
```

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

| Mount Point | Partition  | Type       | Size                 |
|:-----------:|:----------:|:----------:|:--------------------:|
| /mnt/boot   | /dev/***p1 | EFI System | 1GB                  |
| /mnt        | /dev/***p2 | Linux      | Left over            |
| [SWAP]      | /dev/***p3 | Linux swap | 8GB (x2 Hibernation) |

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
cryptsetup luksOpen /dev/***p2 crypt-root
```

Now the partition will be at the following location:

```
ls /dev/mapper/
```

### Format the partitions

```
mkfs.fat -F32 -n EFI /dev/***p1
mkfs.ext4 -L root /dev/mapper/crypt-root
mkswap -L swap /dev/***p3
```

### Mount the partitions

```
mount /dev/mapper/crypt-root /mnt
mount /dev/***p1 /mnt/boot
swapon /dev/***p3
```


### Install Arch

```
pacstrap /mnt base base-devel linux linux-headers linux-firmware nano lvm2
```

### FStab 

```
genfstab -U /mnt >> /mnt/etc/fstab
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

Setting hosts `/etc/hosts` and hostname (`/etc/hostname`) files:

```
127.0.0.1   localhost
::1         localhost
127.0.0.1   myhostname.localdomain myhostname
```

```
myhostname
```

### mkinitcpio.conf

Next edit the `/etc/mkinitcpio.conf` file and change this section:

```
HOOKS=(base udev autodetect modconf block filesystems keyboard fsck)
```

to this:

```
HOOKS=(base udev autodetect modconf block keyboard encrypt lvm2 filesystems fsck)
```

Or this layout if you want to hibernate:

```
HOOKS=(base udev autodetect modconf block keyboard encrypt lvm2 filesystems resume fsck)
```

Note the new encrypt line and it's position.

### InitramFS

```
mkinitcpio -P
```

### Install systemd-boot

```
bootctl install
```

### Create the boot entry for systemd-boot

```
nano /boot/loader/entries/arch.conf
```

Now we'll place these lines in the `arch.conf` file:

```
title Arch Linux
linux /vmlinuz-linux
initrd /initramfs-linux.img
options cryptdevice=/dev/nvme0n1p2:crypt-root root=/dev/mapper/crypt-root rw
```

Use this line if you are going to hibernate:

```
options cryptdevice=/dev/nvme0n1p2:crypt-root root=/dev/mapper/crypt-root resume=/dev/nvme0n1p3 rw
```

**NOTE:**
Be sure to replace the cryptdevice partition name with your own.

### Root password

```
passwd
```

### Install iwd for Internet just in case!

```
pacman -S iwd
```

### Add admin user

```
useradd -m aaronh
passwd aaronh
usermod -aG wheel aaronh
```

### Remove comment for wheel group

```
EDITOR=nano visudo
```

### Install and enable NetworkManager

```
pacman -S networkmanager
systemctl enable NetworkManager
```

# Sources used
- https://linuxhint.com/setup-luks-encryption-on-arch-linux/
- https://gist.github.com/OdinsPlasmaRifle/e16700b83624ff44316f87d9cdbb5c94
