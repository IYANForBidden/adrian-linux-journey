#!/bin/bash

for ping in $(cat subdomains.txt); do

    if ping -c 1 -W 1 $domain > /dev/null; then
        echo "[+] Target $domain ditemukan! (UP)"
    else
        echo "[-] Target $domain tidak valid/mati. (DOWN)"
    fi

done
