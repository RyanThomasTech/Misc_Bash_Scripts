#!/bin/bash

if ! [[ $# -eq 1 ]]; then
	echo Usage: ./fix_exec.sh [FILENAME]
	exit 1
elif ! [[ -f "$1" ]]; then
	echo Please input single file as argument.
	exit 1
fi

ISEXECUTABLE=$(file "$1" | grep -o 'executable')			#check for executable file

#get substring

RWXSTRING=$(ls -l "$1")
USRBIT=${RWXSTRING:3:1}
GRPBIT=${RWXSTRING:6:1}
OTRBIT=${RWXSTRING:9:1}


if [[ $ISEXECUTABLE == "executable" ]]; then

	echo Current executable permissions:
	echo "$USRBIT""$GRPBIT""$OTRBIT"

	if ! [[ $USRBIT == "x" ]]; then
		echo "User executable permission is not set; input [y] to initiate change."
		read USRINPUT
		if [[ $USRINPUT =~ ^[Yy]$ ]]; then
			chmod u+x "$1"
		fi
	fi
			
	if ! [[ $GRPBIT == "x" ]]; then
		echo "Group executable permission is not set; input [y] to initiate change."
		read USRINPUT
		if [[ $USRINPUT =~ ^[Yy]$ ]]; then
			chmod g+x "$1"
		fi
	fi

	if ! [[ $OTRBIT == "x" ]]; then
		echo "Other executable permission is not set; input [y] to initiate change."
		read USRINPUT
		if [[ $USRINPUT =~ ^[Yy]$ ]]; then
			chmod o+x "$1"
		fi
	fi
else
	if  [[ $USRBIT == "x" ]]; then
		echo Removing user-executable flag from non-executable fille.
		chmod u-x "$1"
	fi

	if  [[ $GRPBIT == "x" ]]; then
		echo Removing group-executable flag from non-executable fille.
		chmod g-x "$1"
	fi

	if  [[ $OTRBIT == "x" ]]; then
		echo Removing other-executable flag from non-executable fille.
		chmod o-x "$1"
	fi
fi
