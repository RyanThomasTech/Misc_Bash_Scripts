#!/bin/bash

if [[ $# != 4 ]]; then
	echo 4 Arguments are required.
	exit 1
elif [[ ! -f $1 ]]; then
	echo First argument needs to be a file
	exit 2
fi

sed "s/$3/$4/" $1 > $2
