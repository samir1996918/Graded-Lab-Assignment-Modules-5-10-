#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Error: Exactly one argument required"
    exit 1
fi

if [ -f "$1" ]; then
    echo "File details:"
    wc "$1"
elif [ -d "$1" ]; then
    echo "Directory details:"
    echo "Total files: $(ls -1 "$1" | wc -l)"
    echo "Text files: $(ls "$1"/*.txt 2>/dev/null | wc -l)"
else
    echo "Invalid path"
fi
