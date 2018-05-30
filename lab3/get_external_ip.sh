#!/bin/bash

wget -q www.ipchicken.com
grep -Eom 1 "^[0-9]+.[0-9]+.[0-9]+.[0-9]+" index.html
rm index.html
