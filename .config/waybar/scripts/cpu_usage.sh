#!/bin/bash

# --- CPU USAGE ---
# Get CPU usage using top (more portable than other methods)
CPU_LOAD=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}' | cut -d. -f1)

# --- CPU TEMP ---
# We try a few common paths for CPU temperature
if [ -f /sys/class/thermal/thermal_zone0/temp ]; then
    CPU_TEMP=$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))
elif [ -f /sys/class/hwmon/hwmon1/temp1_input ]; then
    CPU_TEMP=$(($(cat /sys/class/hwmon/hwmon1/temp1_input) / 1000))
else
    CPU_TEMP="??"
fi

# --- RAM USAGE ---
# Extract used and total memory in MB
MEM_DATA=$(free -m | grep Mem)
MEM_USED=$(echo "$MEM_DATA" | awk '{print $3}')
MEM_TOTAL=$(echo "$MEM_DATA" | awk '{print $2}')
MEM_PERC=$(( 100 * $MEM_USED / $MEM_TOTAL ))

# --- OUTPUT ---
# Format the text for the bar
TEXT="|  ${CPU_LOAD}% [${CPU_TEMP}°C] |  ${MEM_PERC}%"

# Format the tooltip (hover info)
TOOLTIP="CPU: ${CPU_LOAD}% at ${CPU_TEMP}°C\nRAM: ${MEM_USED}MB / ${MEM_TOTAL}MB (${MEM_PERC}%)"

# Output as JSON
echo "{\"text\": \"$TEXT\", \"tooltip\": \"$TOOLTIP\", \"class\": \"sysinfo\"}"
