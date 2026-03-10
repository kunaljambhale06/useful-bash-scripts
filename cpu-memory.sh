#!/bin/bash
# ================================================
# Script: cpu_memory.sh
# Description: Displays a snapshot of current CPU
#              load average and RAM usage.
# Concepts: top, free, awk, uptime, command substitution
# ================================================

echo "=============================="
echo "   CPU & Memory Usage Report  "
echo "=============================="
echo ""

# --- CPU Load Average ---
# uptime gives 1, 5, and 15 minute load averages
load=$(uptime | awk -F'load average:' '{print $2}' | xargs)
echo "🖥️  CPU Load Average (1, 5, 15 min): $load"
echo ""

# --- CPU Usage % (using top in batch mode, 1 iteration) ---
cpu_idle=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}' | tr -d '%id,')
# Handle different versions of top output
if [ -z "$cpu_idle" ]; then
    cpu_idle=$(top -bn1 | grep "%Cpu" | awk '{print $8}')
fi

if [[ "$cpu_idle" =~ ^[0-9.]+$ ]]; then
    cpu_used=$(awk "BEGIN {printf \"%.1f\", 100 - $cpu_idle}")
    echo "⚙️  CPU Used: ${cpu_used}%"
    echo "💤 CPU Idle: ${cpu_idle}%"
else
    echo "⚙️  CPU usage data not available on this system."
fi

echo ""

# --- Memory Usage ---
echo "🧠 Memory Usage:"
echo ""

# free -h gives human-readable output
free -h | awk '
NR==1 { printf "  %-10s %-10s %-10s %-10s\n", "", $1, $2, $3 }
NR==2 { printf "  %-10s %-10s %-10s %-10s\n", "RAM:", $2, $3, $4 }
NR==3 { printf "  %-10s %-10s %-10s %-10s\n", "Swap:", $2, $3, $4 }
'

echo ""

# Memory usage percentage
mem_total=$(free | awk '/^Mem:/ {print $2}')
mem_used=$(free | awk '/^Mem:/ {print $3}')

if [ "$mem_total" -gt 0 ]; then
    mem_percent=$(awk "BEGIN {printf \"%.1f\", ($mem_used / $mem_total) * 100}")
    echo "📊 RAM Usage: ${mem_percent}% used"
fi

echo ""
echo "=============================="
echo "Report generated at: $(date)"
echo "=============================="