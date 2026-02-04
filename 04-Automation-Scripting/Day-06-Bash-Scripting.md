
# Day 6: Bash Scripting Dasar (Automation)

**Status:** Completed ✅

**Focus:** Membuat script sederhana untuk otomatisasi tugas berulang (Mass Scanning & Target Checking).

## 🎯 Tujuan Belajar
Seorang Red Teamer tidak melakukan serangan secara manual satu per satu. Kita membutuhkan **Kecepatan**. Hari ini saya belajar bagaimana mengubah perintah manual Linux menjadi script otomatis yang bisa mengecek puluhan target dalam hitungan detik.

## 🧠 Teori & Konsep Kunci

### 1. Anatomi Script (.sh)
Setiap script dimulai dengan "Shebang" (`#!/bin/bash`) untuk memberitahu sistem program apa yang digunakan untuk menjalankannya. Agar bisa jalan, file wajib diberi izin eksekusi:
```bash
chmod +x nama_script.sh
```

### 2. Variables (Wadah Data)

Variabel digunakan untuk menyimpan data agar bisa dipanggil berulang kali.
    - Deklarasi: TARGET="google.com"
    - Panggil: $TARGET (Wajib pakai $ saat dipanggil).

### 3. Looping (for)

Digunakan untuk melakukan tindakan yang sama berulang kali ke target yang berbeda.

## 💻 Jurnal Praktek & Troubleshooting

Hari ini saya membuat script Checker untuk mengecek status website dari sebuah file list. Saya mengalami error logika yang cukup fatal namun memberikan pelajaran berharga.

### ❌ The Struggle (Masalah Awal)

Awalnya, script saya gagal mendeteksi target dengan benar. Outputnya aneh (127.0.0.) dan selalu mengecek google.com, mengabaikan isi file list saya.

Kode Bermasalah:
```bash
# Kesalahan: Menggunakan variabel $ip padahal yang didefinisikan $domain
for domain in $(cat subdomains.txt); do
   if ping -c 1 -W 1 127.0.0.$ip > /dev/null; then ...
```

Diagnosa Error:
    - Variable Mismatch: Saya mendefinisikan for domain, tapi memanggilnya dengan $ip. Karena $ip kosong, sistem membacanya sebagai teks kosong.
    - Hardcoded Logic: Saya masih menggunakan 127.0.0. (sisa latihan sebelumnya), padahal file subdomains.txt berisi nama domain lengkap (google.com).

### ✅ The Solution (Perbaikan)

Saya memperbaiki logika dengan memahami bahwa Script adalah mesin, dan File adalah bahan bakar. Script tidak perlu mempedulikan isi file, dia hanya memproses variabel yang diberikan.

Kode Final (Working):

```bash
#!/bin/bash

# Membaca isi file subdomains.txt baris per baris
for domain in $(cat subdomains.txt); do

    # Menggunakan variabel $domain yang benar
    # -c 1 = Ping 1 kali
    # -W 1 = Tunggu max 1 detik
    if ping -c 1 -W 1 $domain > /dev/null; then
        echo "[+] Target $domain ditemukan! (UP)"
    else
        echo "[-] Target $domain tidak valid/mati. (DOWN)"
    fi

done
```

### Hasil Eksekusi: Script berhasil membedakan mana domain yang aktif (UP) dan mana domain ngawur (DOWN) secara otomatis sesuai isi file subdomains.txt.
🛠️ Tools Created

Saya berhasil membuat 3 script dasar hari ini:
    - setup_target.sh: Script interaktif yang meminta input User (IP & Port) lalu menyimpannya dalam variabel.
    - pingsweep.sh: Network scanner sederhana menggunakan Loop angka (seq 1 5) untuk mencari host hidup di jaringan lokal.
    - checker.sh: Domain availability checker yang membaca input dari file eksternal (.txt).

## 📝 Key Takeaways
    Konsistensi Variabel: Nama variabel saat deklarasi (for x) harus sama dengan saat dipanggil ($x).
    Automation Mindset: Jika kamu harus melakukan sesuatu lebih dari 3 kali, buatlah script-nya.
    Logic over Syntax: Memperbaiki script bukan sekadar menghapus error, tapi memahami alur data dari file ke variabel, lalu ke perintah eksekusi.
