#!/bin/bash

# Script: Domain Availability Checker
# Author: Adrian
# Description: Membaca list domain dari file dan mengecek statusnya (UP/DOWN)

# Baca isi file subdomains.txt satu per satu
for domain in $(cat subdomains.txt); do

    # Menggunakan ping dengan timeout 1 detik (-W 1) dan count 1 kali (-c 1)
    if ping -c 1 -W 1 $domain > /dev/null; then
        echo "[+] Target $domain ditemukan! (UP)"
    else
        echo "[-] Target $domain tidak valid/mati. (DOWN)"
    fi

done
