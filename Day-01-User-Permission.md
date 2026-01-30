# Belajar Linux Day 1 : Membedah Permission dan User Management

**Author:** Adrian  
**Status:** Learning in Progress  
**OS:** Ubuntu 24.04  

---

## 🎯 Tujuan Belajar
Memahami bagaimana Linux mengatur hak akses user (User Privilege), konsep *Least Privilege*, serta mengapa akses `root` menjadi target utama attacker.

---

## 🧠 Konsep Dasar
Linux memisahkan hak akses antara:
- **User biasa**
- **Group**
- **Root (superuser)**

Tujuan saya adalah memahami hierarki ini agar kerusakan sistem bisa diminimalkan jika satu akun dikompromi.

---

## 🚧 Tantangan Hari Ini
Saya mencoba mempraktikkan konsep *Least Privilege* dengan membuat user baru bernama `tamu` dan membandingkannya dengan user utama saya.

### 1. Eksperimen File Shadow
Saya belajar bahwa password di Linux tidak disimpan di `/etc/passwd`, melainkan di `/etc/shadow`.
- **Percobaan:** `cat /etc/shadow`
- **Hasil:** *Permission Denied*.
- **Analisis:** Linux memblokir akses ini karena saya hanya user biasa ($). Hanya root (#) yang boleh melihat hash password.

### 2. Simulasi User "Tamu"
Saya membuat user dummy untuk simulasi serangan dan mencoba menjalankan perintah `sudo`.

**Perintah yang dijalankan:**
```bash
# 1. Membuat user baru
sudo adduser tamu

# 2. Login sebagai tamu
su - tamu

# 3. Mencoba update (Ekspektasi: Error)
sudo apt update
```

Hasil Error: Saat saya menekan enter, muncul pesan error fatal:
```bash
tamu is not in the sudoers file. This incident will be reported.
```
# Bukti Screenshot:

### 3. Eksperimen Chmod (Siapa Pemiliknya?)
Saya mencoba membuat file dan mengubah izinnya agar orang lain tidak bisa baca.
    Perintah: chmod o-r rahasia.txt
    Hasil: User lain (Others) tidak bisa melihat isi file, tapi saya (Owner) tetap bisa.
    Pelajaran: Linux selalu mendahulukan identitas Owner sebelum mengecek aturan Others.

### 💡 Pelajaran Penting (The "Aha!" Moment)
Error tamu is not in the sudoers file mengajarkan saya bahwa:
    Hierarki Keamanan: Tidak semua user sama. User baru secara default tidak punya kekuatan apa-apa.
    Sudoers: Ini adalah daftar VIP. Jika user tidak ada di daftar ini, dia tidak bisa mengubah sistem.
    Red Team Mindset: Jika saya berhasil hack server orang dan masuk sebagai tamu, saya tidak berguna kecuali saya melakukan Privilege Escalation.
