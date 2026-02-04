#!/bin/bash

words=$(tr -s ' ' '\n' < input.txt)

echo "Longest word:"
echo "$words" | awk '{ print length, $0 }' | sort -nr | head -1

echo "Shortest word:"
echo "$words" | awk '{ print length, $0 }' | sort -n | head -1

echo "Average word length:"
echo "$words" | awk '{ sum+=length; count++ } END { print sum/count }'

echo "Total unique words:"
echo "$words" | tr 'A-Z' 'a-z' | sort | uniq | wc -l
