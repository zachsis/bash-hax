#!/bin/bash

for ip in $(seq 72 91); do
  host 38.100.193.$ip | grep "megacorp" | awk -v FS=" " '{print $1 $5}' &
done
