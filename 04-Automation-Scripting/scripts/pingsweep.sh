#!/bin/bash

echo "Mulai scanning jaringan lokal..."

# Loop dari angka 1 sampai 5
for ip in $(seq 1 5); do
    # Ping 1 kali (-c 1), tunggu max 1 detik (-W 1), buang output sampah ke /dev/null
    if ping -c 1 -W 1 127.0.0.$ip > /dev/null; then
        echo "[+] Host 127.0.0.$ip is UP (Aktif)"
    else
        echo "[-] Host 127.0.0.$ip is DOWN"
    fi
done
