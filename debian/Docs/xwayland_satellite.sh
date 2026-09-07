!/bin/bash
git clone https://github.com/Supreeeme/xwayland-satellite.git
cd xwayland-satellite
cargo build --release

cp target/release/xwayland-satellite ~/.local/bin/xwayland-satellite
sudo ln -sf ~/.local/bin/xwayland-satellite /usr/local/bin/xwayland-satellite
