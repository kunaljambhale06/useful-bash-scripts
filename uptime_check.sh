#!/bin/bash
# ================================================
# Script: uptime_check.sh
# Description: Displays how long the system has
#              been running and formats it nicely.
# Concepts: uptime, awk, date, /proc/uptime
# ================================================

echo "=============================="
echo "       System Uptime Info     "
echo "=============================="
echo ""

# Raw uptime string
echo "📋 Raw uptime:  $(uptime -p)"
echo "🕐 Since:       $(uptime -s)"
echo ""

# Parse /proc/uptime for precise breakdown
uptime_seconds=$(awk '{print int($1)}' /proc/uptime)

days=$(( uptime_seconds / 86400 ))
hours=$(( (uptime_seconds % 86400) / 3600 ))
minutes=$(( (uptime_seconds % 3600) / 60 ))
seconds=$(( uptime_seconds % 60 ))

echo "⏱️  System has been up for:"
echo "   ${days} day(s), ${hours} hour(s), ${minutes} minute(s), ${seconds} second(s)"
echo ""

# Friendly message based on uptime
if [ "$days" -ge 30 ]; then
    echo "🏆 Impressive! System has been up for over a month."
elif [ "$days" -ge 7 ]; then
    echo "👍 Great stability — over a week of uptime."
elif [ "$days" -ge 1 ]; then
    echo "✅ System has been running for more than a day."
else
    echo "🔄 System was recently restarted."
fi

echo ""
echo "=============================="
echo "Checked at: $(date)"
echo "=============================="