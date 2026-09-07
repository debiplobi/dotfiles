```

wget https://ziglang.org/download/0.16.0/zig-x86_64-linux-0.16.0.tar.xz

tar -xvf zig-x86_64-linux-0.16.0.tar.xz 
sudo tar -xf zig-*.tar.xz -C /opt/
sudo ln -sf /opt/zig-*/zig /usr/local/bin/zig


git clone https://codeberg.org/fairyglade/ly
cd ly
git checkout v1.4.1
sudo zig build installexe -Dinit_system=systemd
sudo systemctl disable getty@tty2.service
systemctl enable ly@tty2.service

```

