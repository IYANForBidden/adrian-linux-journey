# 🛡️ Linux Red Team Journey: From Zero to Hero

![Status](https://img.shields.io/badge/Status-Active_Learning-success?style=for-the-badge&logo=linux)
![Focus](https://img.shields.io/badge/Focus-Red_Team_Operations-red?style=for-the-badge&logo=kali-linux)
![Author](https://img.shields.io/badge/Author-Adrian-blue?style=for-the-badge)

## 🚀 About This Repository
Repository ini adalah dokumentasi teknis dari perjalanan saya mempelajari Linux secara mendalam dengan fokus pada **Cyber Security** dan **Red Team Operations**.

Tujuan saya bukan hanya sekadar "bisa pakai Linux", tapi memahami internal sistem, memanipulasi permission, hingga menyusun strategi weaponization dan otomatisasi serangan.

> *"Hacker tidak bergantung pada tools, mereka menciptakan jalan ketika buntu."*

---

## 🗺️ Learning Roadmap & Progress

### 📂 Phase 1: System Internals & Permissions
| Day | Topic | Key Concepts | Status |
| :--- | :--- | :--- | :--- |
| **01** | [User & Permissions](01-System-Internals/Day-01-User-Permission.md) | `chmod`, `chown`, File Attributes | ✅ Done |
| **02** | [Privilege Escalation](01-System-Internals/Day-02-SUID-Privilege-Escalation.md) | SUID Bits, `find` exploits, Root access | ✅ Done |
| **03** | [Process Management](01-System-Internals/Day-03-Process-Management.md) | Process Stealth, Background Jobs, Service Recon | ✅ Done |

### 📂 Phase 2: Weaponization & Networking
| Day | Topic | Key Concepts | Status |
| :--- | :--- | :--- | :--- |
| **04** | [Weaponization & GCC](02-Package-Weaponization/Day-04-APT-Git-Compile.md) | Local Compilation, `apt`, Troubleshooting `404` | ✅ Done |
| **05** | [Networking & C2](03-Networking-C2/Day-05-Networking-Netcat.md) | Netcat, Port Listening, Reverse Shell logic | ✅ Done |

### 📂 Phase 3: Automation & Scripting
| Day | Topic | Key Concepts | Status |
| :--- | :--- | :--- | :--- |
| **06** | [Bash Scripting Basics](04-Automation-Scripting/Day-06-Bash-Scripting.md) | Variables, Loops (`for`), Conditionals (`if`) | ✅ Done |
| **10** | [Bash for Hackers](04-Automation-Scripting/Day10_Bash_Scripting.md) | Custom Tools (`ipsweep`), One-Liners, Parallel Exec (`&`) | ✅ Done |

### 📂 Phase 4: Stealth & Lateral Movement
| Day | Topic | Key Concepts | Status |
| :--- | :--- | :--- | :--- |
| **07** | [Logging & Stealth](05-Stealth-Logging/Day-07-Logging-Grep.md) | `grep` Hunting, Log Analysis, Covering Tracks (`truncate`) | ✅ Done |
| **08** | [SSH & Lateral Movement](06-SSH-Lateral-Movement/Day8_SSH_Lateral_Movement.md) | Remote Access, `scp` Exfiltration, Key Management | ✅ Done |

### 📂 Phase 5: Persistence & Maintenance
| Day | Topic | Key Concepts | Status |
| :--- | :--- | :--- | :--- |
| **09** | [Cron Jobs & Persistence](07-Persistence-Cron/Day9_Persistence_Cron_Jobs.md) | Scheduled Tasks, `crontab`, Malware Beacon Logic | ✅ Done |

---

## 🛠️ Red Team Arsenal (Tools I've Mastered)

Berikut adalah command dan tools yang sudah saya pelajari dan praktekkan dalam skenario simulasi:

* **Reconnaissance:** `id`, `whoami`, `ps aux`, `top`, `systemctl`.
* **Network & Connectivity:** `ip addr`, `ss -antp`, `nc` (Netcat), `ping` (sweep).
* **Lateral Movement:** `ssh` (Remote Access), `scp` (Secure File Transfer/Exfiltration).
* **Persistence:** `crontab -e` (Scheduled Tasks), `* * * * *` (Cron Syntax).
* **Automation:** Bash Scripting (`for` loops, Arguments `$1`, Parallel Jobs `&`, One-Liners).
* **Stealth & Hunting:** `grep -r` (Finding secrets), `tail -f` (Log monitoring), `> file` (Log wiping).
* **Data Manipulation:** `cut`, `tr`, `sort`, `uniq` (Cleaning raw output).
* **Access Control:** `chmod` (termasuk SUID `u+s`), `chown`, `chattr`.
* **Weaponization:** `gcc` (Compiling C exploits), `make`, `dpkg`.

---
*Created with ❤️ and ☕ by Adrian*
