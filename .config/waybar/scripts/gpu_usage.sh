#!/bin/bash
DATA=$(nvtop -s)

AMD_JSON=$(echo "$DATA" | jq -c '[.[] | select(.device_name | test("AMD"; "i"))][0]')
NVI_JSON=$(echo "$DATA" | jq -c '[.[] | select(.device_name | test("NVIDIA"; "i"))][0]')

AMD_LOAD=$(echo "$AMD_JSON" | jq -r '.gpu_util' | tr -d '%')
NVI_LOAD=$(echo "$NVI_JSON" | jq -r '.gpu_util' | tr -d '%')
AMD_TEMP=$(echo "$AMD_JSON" | jq -r '.temp' | tr -d 'C')
NVI_TEMP=$(echo "$NVI_JSON" | jq -r '.temp' | tr -d 'C')

echo "{\"text\": \" AMD: ${AMD_LOAD}% | NVD: ${NVI_LOAD}% \", \"tooltip\": \"AMD Usage: ${AMD_LOAD}%\\nNvidia Usage: ${NVI_LOAD}%\"}"
