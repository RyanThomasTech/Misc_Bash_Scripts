#!/bin/bash

linecount=$(wc -l $3 | cut -d " " -f1)
if [[ "$#" -ne 4 ]]; then
	if [[ "$1" -gt "$2" ]]; then
		echo "second arg must be greater or equal to first"
	elif [[ "$2" -gt "$linecount" ]]; then
		echo "second arg must be less than or equal to file line count"
	elif [[ -f "$3" ]]; then
		diff=$(($2-$1+1))
		head -n $2 $3 | tail -n $diff
	else
		echo "3rd arg must be a file"
	fi
else
	echo "Usage: ./print_lines [START] [END] [FILENAME]"
fi
