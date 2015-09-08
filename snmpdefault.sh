#!/bin/bash
echo "what network to scan?"
read NETWORK
echo "which version of snmp? (1,2)"
read VERSION

nmap -sU -p161 ${NETWORK} --open -oG nmaptemp

OUTFILE=$(date +%F-%H.%M)-snmp.csv


echo "[+] testing all open SNMP hosts with version ${VERSION}"
for ip in $( grep -v "Status: Up" nmaptemp | awk -F" " '{print $2}' )
do  
    echo "[+] testing $ip"
    timeout 5 snmp-check -c Public -d -v ${VERSION} -t $ip -T 10 >> ${OUTFILE}
done

rm nmaptemp

echo '[+] done'
