#!/bin/bash

dir=$1

if [ ! -d "$dir" ]; then
    echo "Error: Directory does not exist"
    exit 1
fi

mkdir -p "$dir/backup"

for file in "$dir"/*
do
    mv "$file" "$dir/backup/" &
    echo "Moved $file with PID $!"
done

wait
echo "All background processes completed"
