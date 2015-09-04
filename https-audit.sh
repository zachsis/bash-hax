#!/bin/bash
echo "what port to scan?"
read PORT
echo "what network to scan?"
read NETWORK

nmap -p${PORT} ${NETWORK} --open -oG nmaptemp

OUTFILE=$(date +%F-%H.%M)

echo "[+] testing all port 80 hosts"
for ip in $( awk -F" " '{print $2}' < nmaptemp )
do
        CODE=$(timeout 10 curl -s -o /dev/null -w "%{http_code}" http://$ip)
        if [[ "$CODE" = "301" ]] || [[ "$CODE" = "302" ]]; then
                echo "$CODE,Redirection DETECTED, $ip" >> ${OUTFILE}
        else
                echo "$CODE,No redirect, $ip" >> ${OUTFILE}
        fi
done

rm nmaptemp

echo '[+] done'
