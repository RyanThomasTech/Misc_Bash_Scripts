#!/bin/bash

total=0
count=1
while read line; do
	word_count=$(echo $line | wc -w)
	echo "Line $count: $word_count"	
	((count++))
	total=$((word_count+total))
done
echo "Total words in file: $total"
