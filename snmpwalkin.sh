#!/bin/bash

if [ -z $1 ];
then 
    echo "[*] usage ./snmpwalkin.sh <ip>"
    exit 0
fi


for i in $(awk -v FS=" " '{print $1}' < /root/temp/winmibs ); do
        echo '[*]'
        echo "[*] enumerating mib $i"
        echo '[*]'
    snmpwalk -c public -v1 $1 $i;
done
