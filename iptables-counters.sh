#!/bin/bash

#reset all counters and iptables rules
iptables -Z && iptables -F
# measure incoming traffic to 192.168.15.220
iptables -I INPUT 1 -s 192.168.15.220 -j ACCEPT
# measure outgoing traffic to 192.168.31.220 
iptables -I OUTPUT 1 -d 192.168.15.220 -j ACCEPT
