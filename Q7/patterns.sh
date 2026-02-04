#!/bin/bash

> vowels.txt
> consonants.txt
> mixed.txt

while read word
do
    w=$(echo "$word" | tr 'A-Z' 'a-z')

    if [[ $w =~ ^[aeiou]+$ ]]; then
        echo "$word" >> vowels.txt

    elif [[ $w =~ ^[^aeiou]+$ ]]; then
        echo "$word" >> consonants.txt

    elif [[ $w =~ ^[^aeiou][a-z]+$ ]]; then
        echo "$word" >> mixed.txt
    fi
done < words.txt
