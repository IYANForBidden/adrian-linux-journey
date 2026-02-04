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
| **06** | [Bash Scripting Basics](04-Automation-Scripting/Day-06-Bash-Scripting.md) | Variables, Loops (`for`), Conditionals (`if`), Mass Scanning | ✅ Done |

---

## 🛠️ Red Team Arsenal (Tools I've Mastered)

Berikut adalah command dan tools yang sudah saya pelajari dan praktekkan dalam skenario simulasi:

* **Reconnaissance:** `id`, `whoami`, `ps aux`, `top`, `systemctl`.
* **Network & Connectivity:** `ip addr`, `ss -antp`, `nc` (Netcat), `ping`.
* **Automation:** Bash Scripting (`for` loops, variables, input redirection `>`).
* **Access Control:** `chmod` (termasuk SUID `u+s`), `chown`, `chattr`.
* **Weaponization:** `gcc` (Compiling C exploits), `make`, `dpkg`.

---
*Created with ❤️ and ☕ by Adrian*
