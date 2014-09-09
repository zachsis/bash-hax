#!/bin/bash

for user in $(cat /root/bin/users.txt); do 
  echo VRFY $user | nc -nv -w 1 192.168.15.215 25 2>/dev/null | grep ^"250";
done
