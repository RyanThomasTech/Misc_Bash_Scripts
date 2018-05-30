#!/bin/bash

if ! [[ $# -eq 0 ]]; then
	echo Usage: sudo ./add_new_users.sh < file
	exit 1
fi

while read line
do
	
	firstName=$(cut -d , -f 1 <<< $line )
	lastName=$(cut -d , -f 2 <<< $line )
	lowercaseFirst=$(echo $firstName | tr 'A-Z' 'a-z' )
	lowercaseLast=$(echo $lastName | tr 'A-Z' 'a-z' )
	lastInit=${lowercaseLast:0:1}
	userName="$lowercaseFirst""$lastInit"
	alreadyExists=$(cat /etc/passwd | grep -Eoc  ^"$userName": )
	endingNum=0
	while [[ alreadyExists -eq 1 ]]; do
		((endingNum++))
		userName="$lowercaseFirst""$lastInit""$endingNum"
		alreadyExists=$(cat /etc/passwd | grep -Eoc  \"^"$userName":\" )
	done
	/usr/sbin/groupadd "$userName"
	/usr/sbin/useradd -c "$firstName $lastName" -d /home/"$userName" -g "$userName" -m -s /bin/bash "$userName"
	cat /dev/urandom | tr -dc 'A-Za-z0-9' | head -c 8 > /tmp/pw.tmp
	password=$(cat /tmp/pw.tmp)
	cat /tmp/pw.tmp | /usr/bin/passwd --stdin "$userName" > /dev/null

	echo adding: "$firstName" "$lastName": "$userName", "$password" 
done

