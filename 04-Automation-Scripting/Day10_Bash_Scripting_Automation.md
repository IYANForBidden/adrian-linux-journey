# ☠️ Linux Red Team Operations - Day 10

**Topic:** Bash Scripting for Hackers (Automation)  
**Date:** 2026-02-10  
**Status:** Completed ✅  
**Author:** Adrian (Mas Yaan)

---

## 🎯 Objective

Hari ini fokus mempelajari **Bash Scripting** sebagai fondasi untuk membuat alat hacking sendiri (*Living off the Land*). Tujuannya adalah mengubah tugas manual yang lambat menjadi otomatisasi cepat.

1.  **Automation:** Membuat script `.sh` untuk melakukan *Ping Sweep* otomatis pada jaringan.
2.  **Logic & Control:** Memahami penggunaan `Loops` (perulangan) dan `Arguments` (input dinamis).
3.  **One-Liner:** Teknik menjalankan perintah kompleks dalam satu baris terminal untuk situasi akses terbatas.
4.  **Custom Tooling:** Mengembangkan tool `ipsweep` sederhana untuk menggantikan fungsi dasar Nmap.

---

## 1. The Theory: Building Blocks

Script bash adalah kumpulan perintah terminal yang dijalankan berurutan dengan logika pemrograman.

* **Shebang (`#!/bin/bash`):** Memberi tahu sistem interpreter yang digunakan.
* **Variables:** Wadah penyimpanan data (contoh: `IP="192.168.1.1"`).
* **Arguments (`$1`):** Input dari user saat menjalankan script (contoh: `./scan.sh <target>`).
* **Loops:** Melakukan aksi berulang (sangat berguna untuk scanning ratusan IP).

---

## 2. Practical Lab: Creating 'IP Sweeper'

### A. Script Creation & Debugging
Tahap awal membuat file `ipsweep.sh`. Pada percobaan pertama, terjadi *syntax error* dan kesalahan target subnet, namun berhasil diperbaiki melalui debugging dan pengecekan interface `ip addr`.

![Script Creation Process](images/day10_01_script_creation_debug.png)
*Gambar 1: Proses pembuatan script, perbaikan syntax error, dan verifikasi interface jaringan.*

### B. The Code (`ipsweep.sh`)
Script final yang digunakan untuk scanning:

```bash
#!/bin/bash

if [ "$1" == "" ]
then
    echo "You forgot an IP address!"
    echo "Syntax: ./ipsweep.sh 192.168.1"
else
    # Loop scanning IP 1-254
    for ip in `seq 1 254`; do
        ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
    done
fi
```

## 3. Execution & Results
Scanning the Correct Subnet

Setelah mengetahui IP target berada di subnet 192.168.40.x (dari interface ens33), script dijalankan kembali dan berhasil mengidentifikasi host yang aktif.
The "One-Liner" Technique

Selain menggunakan file script, saya juga mempraktikkan teknik One-Liner langsung di terminal:
```bash
for i in {1..20}; do (ping -c 1 192.168.40.$i | grep "bytes from" &); done
```

# 📝 Key Takeaways

    Arguments ($1) membuat tools lebih fleksibel tanpa perlu mengedit kode setiap ganti target.

    Background Process (&) sangat krusial dalam network scanning agar proses berjalan paralel (cepat) dan tidak sekuensial (lambat).

    Command Substitution (cut, tr, grep) memungkinkan kita mengambil data bersih (hanya IP address) dari output yang berantakan.
