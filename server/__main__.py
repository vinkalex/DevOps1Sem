#!/usr/bin/env python3

from socket import socket, AF_INET, SOCK_STREAM

HOST = '0.0.0.0'
PORT = 6565

with socket(AF_INET, SOCK_STREAM) as s:
    s.bind((HOST, PORT))
    s.listen()

    while True:
        conn, addr = s.accept()
        print('Connected by', addr)
        while True:
            data = conn.recv(1024)
            if not data:
                break
            conn.sendall(data)