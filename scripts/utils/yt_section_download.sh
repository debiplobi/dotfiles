#!/bin/bash
set -e

# --- CONFIG ---
VIDEO_URL="url"
SECTIONS=(
  "00:00:52-00:01:48"
  "00:05:34-00:06:22"
  "00:11:41-00:11:49"
)

YTDLP="yt-dlp --cookies-from-browser firefox"
TMP_DIR="$(mktemp -d)"

# Extracting title and ID separately to format the final filename
RAW_TITLE="$($YTDLP --print title "$VIDEO_URL" | sed 's/[\/:*?"<>|]/_/g')"
VIDEO_ID="$($YTDLP --print id "$VIDEO_URL")"

# New filename format: Title [ID]_edited.mp4
FINAL_OUTPUT="${RAW_TITLE} [${VIDEO_ID}]_edited.mp4"
MERGE_LIST="$TMP_DIR/merge_list.txt"

echo "🎬 Title  : $RAW_TITLE"
echo "🆔 ID     : $VIDEO_ID"
echo "📁 Temp   : $TMP_DIR"
echo "📦 Output : $FINAL_OUTPUT"

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
# Added -bsf:a opus_metadata to handle the Opus header errors common in YouTube cuts
ffmpeg -loglevel error -stats \
  -f concat -safe 0 -i "$MERGE_LIST" -c copy -bsf:a opus_metadata "$FINAL_OUTPUT"

rm -rf "$TMP_DIR"
echo "✅ Done → $FINAL_OUTPUT"
