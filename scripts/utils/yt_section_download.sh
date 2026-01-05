#!/bin/bash

# Video URL
VIDEO_URL="https://youtu.be/HMGmuNiHhZM?si=jfGYeb1tWY98FG-i"

# Output base name (no extension)
OUTPUT_BASE="output_clip"

# Time sections to extract (format: start-end)
SECTIONS=(
    "00:06:11-00:06:31"
    # "00:01:15-00:01:48"
    # "00:11:23-00:12:22"
)

# Clean up any existing files
rm -f "${OUTPUT_BASE}"_*.mp4 merge_list.txt final_output.mp4

# Download each section
for i in "${!SECTIONS[@]}"; do
    START_END="${SECTIONS[$i]}"
    INDEX=$(printf "%02d" $((i + 1)))
    OUTFILE="${OUTPUT_BASE}_${INDEX}.mp4"
    
    echo "Downloading section: $START_END → $OUTFILE"

    yt-dlp --cookies-from-browser firefox \
        --download-sections "*${START_END}" \
        --merge-output-format mp4 \
        -o "$OUTFILE" \
        "$VIDEO_URL"
    
    # Add to merge list for ffmpeg
    echo "file '$OUTFILE'" >> merge_list.txt
done

# Merge clips
echo "Merging clips into final_output.mp4..."
ffmpeg -f concat -safe 0 -i merge_list.txt -c copy final_output.mp4


rm -f merge_list.txt 
echo "✅ Done. Output saved to: final_output.mp4"
