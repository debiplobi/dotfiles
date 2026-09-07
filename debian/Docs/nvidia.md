```
deb http://deb.debian.org/debian/ trixie main contrib non-free non-free-firmware
```

first of all replace the first line with above line in `/etc/apt/sources.list`

then

```
sudo apt update && sudo apt upgrade -y
sudo apt install linux-headers-$(uname -r)
sudo apt install nvidia-driver firmware-misc-nonfree firmware-nvidia-gsp
```

then reboot
