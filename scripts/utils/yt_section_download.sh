#!/bin/bash
set -e

# --- CONFIG ---
VIDEO_URL="https://www.youtube.com/watch?v=V2G1yd0XfrY"

SECTIONS=(
  "00:00:45-00:01:29"
  "00:04:10-00:04:55"
  "00:10:30-00:12:20"
)

# --- ALWAYS use cookies ---
YTDLP="yt-dlp --cookies-from-browser firefox"

# Temp dir (auto-cleaned)
TMP_DIR="$(mktemp -d)"

# Get safe video title
VIDEO_TITLE="$($YTDLP --print title "$VIDEO_URL" | sed 's/[\/:*?"<>|]/_/g')"
FINAL_OUTPUT="${VIDEO_TITLE}.mp4"

MERGE_LIST="$TMP_DIR/merge_list.txt"

echo "🎬 Title : $VIDEO_TITLE"
echo "📁 Temp  : $TMP_DIR"

# Download sections
for i in "${!SECTIONS[@]}"; do
  START_END="${SECTIONS[$i]}"
  INDEX=$(printf "%02d" $((i + 1)))
  OUTFILE="$TMP_DIR/clip_${INDEX}.mp4"

  echo "⬇️  $START_END"

  $YTDLP \
    --download-sections "*${START_END}" \
    --merge-output-format mp4 \
    -o "$OUTFILE" \
    "$VIDEO_URL"

  echo "file '$OUTFILE'" >> "$MERGE_LIST"
done

# Merge
echo "🔗 Merging → $FINAL_OUTPUT"
ffmpeg -loglevel error -stats \
  -f concat -safe 0 -i "$MERGE_LIST" -c copy "$FINAL_OUTPUT"

# Cleanup
rm -rf "$TMP_DIR"

echo "✅ Done → $FINAL_OUTPUT"
