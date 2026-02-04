#!/bin/bash

grep -E "^[a-zA-Z0-9]+@[a-zA-Z]+\.com$" emails.txt | sort | uniq > valid.txt
grep -Ev "^[a-zA-Z0-9]+@[a-zA-Z]+\.com$" emails.txt > invalid.txt
