#!/bin/bash

# Minta input dari user
echo "Masukkan IP Target:"
read IP_TARGET

echo "Masukkan Port:"
read PORT

echo "------------------------------------"
echo "[+] Target Locked: $IP_TARGET"
echo "[+] Scanning Port: $PORT"
echo "------------------------------------"
# Simulasi perintah nmap (hanya echo)
echo "Menjalankan: nmap -p $PORT $IP_TARGET"
