#!/usr/bin/env bash
set -euo pipefail

echo "==> 1. Installing build dependencies and rustup via apt..."
sudo apt-get update
sudo apt-get install -y \
    git \
    curl \
    gcc \
    clang \
    pkg-config \
    libudev-dev \
    libgbm-dev \
    libxkbcommon-dev \
    libegl1-mesa-dev \
    libwayland-dev \
    libinput-dev \
    libdbus-1-dev \
    libsystemd-dev \
    libseat-dev \
    libpipewire-0.3-dev \
    libpango1.0-dev \
    libdisplay-info-dev

echo "==> 2. Checking for rustup and configuring stable toolchain..."
if ! command -v rustup &> /dev/null; then
    echo "rustup not found. Installing via apt..."
    sudo apt-get install -y rustup
fi

# Set stable toolchain as default
rustup default stable

# Source cargo env if present
if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi

# Clone or navigate to the repository
REPO_DIR="niri"
if [ ! -d "$REPO_DIR" ]; then
    echo "==> 3. Cloning niri repository..."
    git clone https://github.com/YaLTeR/niri.git "$REPO_DIR"
    cd "$REPO_DIR"
else
    echo "==> 3. Navigating to existing niri directory and fetching tags..."
    cd "$REPO_DIR"
    git fetch --tags --all
fi

echo "==> 4. Checking out tag v26.04..."
git checkout v26.04

echo "==> 5. Building niri (Release mode)..."
cargo build --release

echo "==> 6. Installing files to documented destinations..."

# Create target directories
sudo mkdir -p /usr/local/bin
sudo mkdir -p /usr/local/share/wayland-sessions
sudo mkdir -p /usr/share/wayland-sessions
sudo mkdir -p /usr/local/share/xdg-desktop-portal
sudo mkdir -p /etc/systemd/user

# Install binaries and scripts
sudo install -m 755 target/release/niri /usr/local/bin/niri
sudo install -m 755 resources/niri-session /usr/local/bin/niri-session

# Install desktop entry and portal config
sudo install -m 644 resources/niri.desktop /usr/local/share/wayland-sessions/niri.desktop
sudo install -m 644 resources/niri.desktop /usr/share/wayland-sessions/niri.desktop
sudo install -m 644 resources/niri-portals.conf /usr/local/share/xdg-desktop-portal/niri-portals.conf

# Prepare and install systemd units (adjusting binary path to /usr/local/bin/niri)
sed 's|/usr/bin/niri|/usr/local/bin/niri|g' resources/niri.service > /tmp/niri.service
sudo install -m 644 /tmp/niri.service /etc/systemd/user/niri.service
rm /tmp/niri.service

sudo install -m 644 resources/niri-shutdown.target /etc/systemd/user/niri-shutdown.target

echo "==> Installing xwayland-satellite"
git clone https://github.com/Supreeeme/xwayland-satellite.git
cd xwayland-satellite
cargo build --release

cp target/release/xwayland-satellite ~/.local/bin/xwayland-satellite
sudo ln -sf ~/.local/bin/xwayland-satellite /usr/local/bin/xwayland-satellite

echo "==> Installation complete for niri v26.04! You can now select 'Niri' in your display manager or run 'niri-session' from a TTY."
