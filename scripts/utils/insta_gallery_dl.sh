#!/usr/bin/env bash
# Download Instagram Highlights using gallery-dl

# Check if URL argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <instagram_url>"
  exit 1
fi

URL="$1"

gallery-dl \
  --cookies ~/cookies.txt \
  -o extractor.instagram.include=posts,stories,highlights \
  --sleep-request 15-45 \
  --sleep 2-10 \
  "$URL"
