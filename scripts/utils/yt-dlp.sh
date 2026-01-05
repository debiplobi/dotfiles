#!/bin/bash

# Ask the user for the URL
# read -rp "Enter the video URL: " URL

# Check if URL is empty
# if [ -z "$URL" ]; then
#   echo "No URL entered. Exiting."
#   exit 1
# fi

# Download with best video and best audio
# yt-dlp -f "bv*+ba/b" --download-sections "*00:22:00-00:22:50" -o "%(title)s.%(ext)s" --cookies-from-browser firefox "https://youtu.be/LmjY7ZIAeR4" 

yt-dlp -f "bv*+ba/best" \
--download-sections "*00:08:08-00:08:55" \
-o "%(title)s.%(ext)s" \
"https://youtu.be/GZe5H4EgqdY"
