# Arch-LUKS-systemd-boot-install
Config file and steps to install Arch encrypted with systemd-boot

## Boot from Live Disk

## Connect to the network

```
iwctl
station device connect SSID
```

This command will list the network device:

```
device list
```

### Test the connection

```
ping -c 3 www.google.com
```

## Set the system clock

```
timedatectl set-ntp true
```

## Partition the disk

```
cfdisk /dev/***
```

| Mount Point | Partition  | Type       | Size      |
|:-----------:|:----------:|:----------:|:---------:|
| /mnt/boot   | /dev/***p1 | EFI System | 1GB       |
| /mnt        | /dev/***p2 | Linux      | Left over |
| [SWAP]      | /dev/***p3 | Linux swap | 8GB       |

