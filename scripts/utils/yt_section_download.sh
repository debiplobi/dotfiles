#!/bin/bash
set -e

# --- CONFIG ---
VIDEO_URL="https://youtu.be/46_5fd1uOSs?si=w3wOusQf7BJBw_fZ"
SECTIONS=(
  "00:00:00-00:00:42"
  "00:10:25-00:14:00"
)

YTDLP="yt-dlp --cookies-from-browser firefox"
TMP_DIR="$(mktemp -d)"
VIDEO_TITLE="$($YTDLP --print title "$VIDEO_URL" | sed 's/[\/:*?"<>|]/_/g')"
FINAL_OUTPUT="${VIDEO_TITLE}.mp4"
MERGE_LIST="$TMP_DIR/merge_list.txt"

echo "🎬 Title : $VIDEO_TITLE"
echo "📁 Temp  : $TMP_DIR"

for i in "${!SECTIONS[@]}"; do
  START_END="${SECTIONS[$i]}"
  INDEX=$(printf "%02d" $((i + 1)))
  OUTFILE="$TMP_DIR/clip_${INDEX}.mp4"
  echo "⬇️  Clip $INDEX: $START_END"

  # Retry up to 5 times with increasing sleep
  for attempt in 1 2 3 4 5; do
    echo "   attempt $attempt..."
    $YTDLP \
      --download-sections "*${START_END}" \
      --merge-output-format mp4 \
      --retries 10 \
      --fragment-retries 10 \
      --retry-sleep linear=1::2 \
      --socket-timeout 30 \
      --concurrent-fragments 1 \
      -o "$OUTFILE" \
      "$VIDEO_URL" && break

    echo "   ⚠️  Failed, waiting before retry..."
    sleep $((attempt * 5))
  done

  if [[ ! -f "$OUTFILE" ]]; then
    echo "❌ Failed to download clip $INDEX after 5 attempts. Aborting."
    rm -rf "$TMP_DIR"
    exit 1
  fi

  echo "file '$OUTFILE'" >> "$MERGE_LIST"
done

echo "🔗 Merging → $FINAL_OUTPUT"
ffmpeg -loglevel error -stats \
  -f concat -safe 0 -i "$MERGE_LIST" -c copy "$FINAL_OUTPUT"

rm -rf "$TMP_DIR"
echo "✅ Done → $FINAL_OUTPUT"
