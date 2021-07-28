# Using your Yubikey on Arch

Let's first add the udev rules to access the key as a user:

```
echo 'KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0664", GROUP="users", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="f1d0"' | sudo tee /etc/udev/rules.d/10-security-key.rules
```

Install the module:

```
sudo pacman -S libu2f-host
```

Enable the system start card daemon known as pcscd:

```
sudo systemctl enable pcscd
```

Then reboot for that change to take effect:

```
sudo systemctl reboot
```

# Source(s) used:
- https://michaelheap.com/yubikey-on-arch/
