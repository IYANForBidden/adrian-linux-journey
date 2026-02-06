for domain in $(cat subdomains.txt); do

    # Gunakan variabel $domain langsung. Jangan pakai 127.0.0
    if ping -c 1 -W 1 $domain > /dev/null; then
        echo "[+] Target $domain ditemukan! (UP)"
    else
        echo "[-] Target $domain tidak valid/mati. (DOWN)"
    fi

done
