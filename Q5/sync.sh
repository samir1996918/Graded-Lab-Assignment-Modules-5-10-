#!/bin/bash

dirA="dirA"
dirB="dirB"

echo "Files only in dirA:"
ls "$dirA" | grep -vxF -f <(ls "$dirB")

echo
echo "Files only in dirB:"
ls "$dirB" | grep -vxF -f <(ls "$dirA")

echo
echo "Common files with different content:"
for file in $(ls "$dirA")
do
    if [ -f "$dirB/$file" ]; then
        cmp -s "$dirA/$file" "$dirB/$file"
        if [ $? -ne 0 ]; then
            echo "$file differs"
        fi
    fi
done
