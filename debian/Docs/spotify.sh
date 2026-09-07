#!/bin/bash

# Define the target directory and file
DESKTOP_DIR="$HOME/.local/share/applications"
DESKTOP_FILE="$DESKTOP_DIR/spotify.desktop"

# Ensure the directory exists so the script doesn't fail on fresh installs
mkdir -p "$DESKTOP_DIR"

# Write the shortcut content to the file
cat << 'EOF' > "$DESKTOP_FILE"
[Desktop Entry]
Type=Application
Name=Spotify
GenericName=Music Player
Comment=Spotify streaming music client
Icon=spotify-client
Exec=/usr/bin/spotify %U
Terminal=false
Categories=Audio;Music;Player;AudioVideo;
MimeType=x-scheme-handler/spotify;
StartupWMClass=spotify
EOF

echo "Created desktop entry at $DESKTOP_FILE"

# Reload the rofi cache
echo "Reloading rofi desktop cache..."
rofi -show drun -drun-reload-desktop-cache
