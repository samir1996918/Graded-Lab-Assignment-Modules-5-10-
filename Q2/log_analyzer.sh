#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 logfile"
    exit 1
fi

if [ ! -r "$1" ]; then
    echo "Error: File does not exist or is not readable"
    exit 1
fi

total=$(wc -l < "$1")
info=$(grep -c " INFO " "$1")
warning=$(grep -c " WARNING " "$1")
error=$(grep -c " ERROR " "$1")

last_error=$(grep " ERROR " "$1" | tail -1)

date=$(date +%F)
report="logsummary_$date.txt"

echo "Total log entries: $total" > "$report"
echo "INFO messages: $info" >> "$report"
echo "WARNING messages: $warning" >> "$report"
echo "ERROR messages: $error" >> "$report"
echo "Most recent ERROR:" >> "$report"
echo "$last_error" >> "$report"

cat "$report"
