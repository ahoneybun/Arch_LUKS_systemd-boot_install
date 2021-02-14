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

| Mount Point | Partition  | Type       | Size      |
|:-----------:|:----------:|:----------:|:---------:|
| /mnt/boot   | /dev/***p1 | EFI System | 1GB       |
| /mnt        | /dev/***p2 | Linux      | Left over |
| [SWAP]      | /dev/***p3 | Linux swap | 8GB       |

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
mount /dev/***p1 /mnt/boot
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

### Root password

```
passwd
```

### Install needed packages for LUKS to work

```
pacman -S lvm2
```