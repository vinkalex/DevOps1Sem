#!/usr/bin/env python3

from socket import socket, AF_INET, SOCK_STREAM

HOST = '0.0.0.0'
PORT = 5000

with socket(AF_INET, SOCK_STREAM) as s:
    s.connect((HOST, PORT))
    s.sendall(b'Hello, world')
    data = s.recv(1024)

print('Received', repr(data))
