#!/usr/bin/env bash
set -e

echo "=== Initializing Setup for Firefox on Debian 13.6 ==="

# 1. Create a directory to store APT repository keys if it doesn't exist
echo "-> Creating APT keyring directory..."
sudo install -d -m 0755 /etc/apt/keyrings

# 2. Import the Mozilla APT repository signing key
echo "-> Downloading Mozilla APT signing key..."
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null

# 3. Verify the key fingerprint
echo "-> Verifying key fingerprint..."
# Ensure local gnupg dir exists to prevent the 'directory does not exist' fatal error
mkdir -p -m 700 ~/.gnupg
gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); if($0 == "35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3") print "\n[SUCCESS] The key fingerprint matches ("$0").\n"; else { print "\n[ERROR] Verification failed: the fingerprint ("$0") does not match the expected one.\n"; exit 1 } }'

# 4. Add the Mozilla APT repository (Debian 13 Trixie uses the new .sources format)
echo "-> Adding Mozilla repository to sources.list.d..."
sudo tee /etc/apt/sources.list.d/mozilla.sources > /dev/null << 'EOF'
Types: deb
URIs: https://packages.mozilla.org/apt
Suites: mozilla
Components: main
Signed-By: /etc/apt/keyrings/packages.mozilla.org.asc
EOF

# 5. Configure APT to prioritize packages from the Mozilla repository
echo "-> Pinning Mozilla repository priority..."
sudo tee /etc/apt/preferences.d/mozilla > /dev/null << 'EOF'
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
EOF

# 6. Update package list and install Firefox
echo "-> Updating APT and installing Firefox..."
sudo apt-get update
sudo apt-get install -y firefox

echo "=== Firefox installation completed successfully! ==="
