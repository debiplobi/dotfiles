#!/usr/bin/env bash
set -euo pipefail

URL="https://github.com/usagi-flow/evil-helix/releases/download/release-20250915/evil-helix-amd64-linux.tar.gz"
TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

echo "Downloading evil-helix..."
curl -fL "$URL" -o "${TMP_DIR}/evil-helix.tar.gz"

echo "Extracting..."
tar -xzf "${TMP_DIR}/evil-helix.tar.gz" -C "$TMP_DIR"

echo "Installing binary to /usr/local/bin (sudo password may be required)..."
sudo install -Dm755 "${TMP_DIR}/helix/hx" /usr/local/bin/hx

echo "Updating runtime in ~/.config/helix/runtime..."
mkdir -p "${HOME}/.config/helix"
rm -rf "${HOME}/.config/helix/runtime"
cp -r "${TMP_DIR}/helix/runtime" "${HOME}/.config/helix/"

echo "Installed successfully:"
hx --version
