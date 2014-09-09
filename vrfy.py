#!/usr/bin/python

import socket
import sys

if len(sys.argv) != 2:
    print "Usage: vrfy.py <username>"
    sys.exit(0)
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM) # Create a socket
connect = s.connect(('192.168.15.215',25)) # Connect to the server




