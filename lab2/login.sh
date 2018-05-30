#!/bin/bash

person=$(grep "$USERNAME" /etc/passwd | cut -d ":" -f5)
echo "Welcome to $HOSTNAME, $person!"
echo "You are logged in as $USERNAME and your current directory is $PWD"
echo "The time is $(date "+%l:%M%P")"

