#!/bin/bash

for domain in $(cat subdomains.txt); do

    if ping -c 1 -W 1 127.0,0$ip > /dev/null; then
        echo "[+] Host Google.com$ip is UP (Active)"
    else
        echo "[-] Host Google.com$ip is DOWN"
    fi

done
