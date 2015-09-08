#!/bin/bash
for ip in $(cat $1); do
    NAME=$(nslookup $ip | grep name | awk -F" " '{print $4}')
    WINOUTPUT=$(curl -s http://$ip | grep '<title>IIS')
    if [[ -n "$WINOUTPUT" ]] ; then 
        echo "$ip ("$NAME") has default IIS page"
    fi
    NIXOUTPUT=$(curl -s http://$ip | grep 'It works!')
    if [[ -n "$NIXOUTPUT" ]] ; then
        echo "$ip ("$NAME") has default apache page"
    fi
done

