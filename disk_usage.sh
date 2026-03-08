#!/bin/bash
# ================================================
# Script: disk_usage.sh
# Description: Checks disk usage of all mounted
#              filesystems and warns if any partition
#              exceeds a defined threshold.
# Concepts: df, awk, loops, conditionals, exit codes
# ================================================

THRESHOLD=80  # Warn if usage exceeds this percentage

echo "=============================="
echo "       Disk Usage Report      "
echo "=============================="
echo ""

# Get disk usage for all real filesystems (skip tmpfs, devtmpfs etc.)
df -H --output=source,pcent,target | grep -vE "^Filesystem|tmpfs|devtmpfs|udev" | while read -r line; do

    # Extract the usage percentage (remove the % sign)
    usage=$(echo "$line" | awk '{print $2}' | tr -d '%')
    partition=$(echo "$line" | awk '{print $1}')
    mount=$(echo "$line" | awk '{print $3}')

    # Check if usage is a valid number
    if ! [[ "$usage" =~ ^[0-9]+$ ]]; then
        continue
    fi

    if [ "$usage" -ge "$THRESHOLD" ]; then
        echo "⚠️  WARNING: $partition mounted at $mount is ${usage}% full!"
    else
        echo "  OK:      $partition mounted at $mount is ${usage}% used."
    fi
done

echo ""
echo "Threshold set at: ${THRESHOLD}%"
echo "=============================="
