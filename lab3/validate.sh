#!/bin/bash

echo "First name:"
read firstName
if [[ $firstName =~ ^[A-Z][a-z\-]+$ ]]; then
	echo "Last name:"
	read lastName
	if [[ $lastName =~ ^[A-Z][a-z\-]+$ ]]; then
		echo "Zip Code:"
		read zipCode
		if [[ $zipCode =~ ^[0-9]{5}$ ]]; then
			echo "Email Address:"
			read emailAddress
			if [[ $emailAddress =~ ^[A-Za-z0-9_\.\-]+@[A-Za-z0-9_\.\-]+$ ]]; then
				echo "All inputs accepted as valid."
			else
				echo "Email addresses take the format USER@DOMAIN where both the USER and DOMAIN must contain only letters, numbers, dots, underscores, and hyphens."
				exit 1
			fi
		else
			echo "Zip code must contain exactly 5 digits."
			exit 1	
		fi	
	else
		echo "Last name must start wth a capital letter, and contain only letters."
		exit 1 
	fi
else
	echo "First name must start wth a capital letter, and contain only letters." 
	exit 1
fi

