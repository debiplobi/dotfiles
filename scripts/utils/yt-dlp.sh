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

yt-dlp --cookies-from-browser firefox -f "bv*+ba/best" \
--download-sections "*00:00:42-00:01:10" \
-o "%(title)s.%(ext)s" \
"https://youtu.be/Yd48GOOpXiY?si=kNR74cZ1rFzSJlFe"
