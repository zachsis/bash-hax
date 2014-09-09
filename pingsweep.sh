#!/bin/bash

for last in $(seq 200 254); do 
 ping -c 1 -W 5 192.168.15.$last | grep "from" | awk -v FS=" " '{print $4}' | sed '$s/.$//' & 
done
