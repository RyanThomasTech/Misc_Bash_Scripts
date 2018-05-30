#!/bin/bash

awk -F':' '{if ($3>=1000 && $7=="/bin/bash") print $1}{if ($3>=1000 && $7!="/bin/bash") print $1"*"}' /etc/passwd
