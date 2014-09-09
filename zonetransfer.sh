#!/bin/bash


if [ -z "$1" ]; then
	echo "[*] Simple Zone Transfer Script"
	echo "[*] Usage  : $0 <domain name> "
	exit 0
fi

for nsserver in $(host -t ns $1 | cut -d" " -f4); do 
	host -l $1 $nsserver | grep "has address" | awk -v FS=" " '{print $1 ," ", $4}'
done
