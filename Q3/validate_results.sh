#!/bin/bash

pass_all=0
fail_one=0

while IFS=',' read -r roll name m1 m2 m3
do
    fails=0

    if [ "$m1" -lt 33 ]; then
        fails=$((fails+1))
    fi
    if [ "$m2" -lt 33 ]; then
        fails=$((fails+1))
    fi
    if [ "$m3" -lt 33 ]; then
        fails=$((fails+1))
    fi

    if [ "$fails" -eq 0 ]; then
        echo "$name passed all subjects"
        pass_all=$((pass_all+1))
    elif [ "$fails" -eq 1 ]; then
        echo "$name failed in exactly one subject"
        fail_one=$((fail_one+1))
    fi
done < marks.txt

echo "Total students passed all subjects: $pass_all"
echo "Total students failed exactly one subject: $fail_one"
