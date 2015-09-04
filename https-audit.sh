#!/bin/bash

for ip in $(cat iplist.txt)
do
        CODE=$(timeout 10 curl -s -o /dev/null -w "%{http_code}" $ip)
        if [[ "$CODE" = "301" ]] || [[ "$CODE" = "302" ]]; then
                echo "Status code is $CODE Redirection DETECTED!"
        else
                echo "Status code is $CODE No redirection.."
        fi
done
