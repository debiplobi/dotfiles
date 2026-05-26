#!/bin/bash
# Get data from nvtop
DATA=$(nvtop -s)

# Extract values
AMD_LOAD=$(echo "$DATA" | jq -r '.[0].gpu_util' | tr -d '%')
NVI_LOAD=$(echo "$DATA" | jq -r '.[1].gpu_util' | tr -d '%')
AMD_TEMP=$(echo "$DATA" | jq -r '.[0].temp' | tr -d 'C')
NVI_TEMP=$(echo "$DATA" | jq -r '.[1].temp' | tr -d 'C')

# Output as Waybar-ready JSON
echo "{\"text\": \"  AMD: ${AMD_LOAD}% [${AMD_TEMP}°C] | NVD: ${NVI_LOAD}% [${NVI_TEMP}°C]\", \"tooltip\": \"AMD Usage: ${AMD_LOAD}%\\nNvidia Usage: ${NVI_LOAD}%\"}"
