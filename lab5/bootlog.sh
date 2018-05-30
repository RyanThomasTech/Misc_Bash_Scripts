#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo Usage: ./bootlog [boot/shutdown]
	exit 1
elif [[ ! $1 =~ ^(boot|shutdown)$ ]]; then
	echo Usage: ./bootlog [boot/shutdown]
	exit 1
fi

date=$(date)
echo "$date" "$HOSTNAME" "$1"! >> /home/rthomas/lab5/boot.log
exit 0
