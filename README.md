# Sysadmin Automation Pack (RHEL 9.5)

A lightweight set of Bash scripts to automate system hardening, monitoring, and package auditing on Red Hat Enterprise Linux 9.5. Built for hands-on learners and junior sysadmins looking to level up their Linux administration and scripting skills.

---

## 📁 Repository Structure

sysadmin-automation-pack/ ├── scripts/ │ ├── secure_user_baseline.sh │ ├── service_monitor.sh │ └── package_audit.sh ├── screenshots/ │ ├── secure_user_result.png │ ├── service_monitor_result.png │ ├── package_audit_result.png │ ├── package_audit_result_and_cleanup.png │ ├── locking_unused_accounts.png │ ├── vim_secure_user_baseline.png │ └── monitoring_service_with_crontab.png ├── README.md └── LICENSE


---

## 🔧 Project Overview

This toolkit contains three foundational scripts designed to simulate real-world sysadmin tasks:

1. **User Security Baseline** – Lock unused system accounts, enforce password policies, and create hardened user templates  
2. **Service Monitor** – Track and restart critical services (e.g. SSH, firewalld) using systemctl + cron  
3. **Package Audit Script** – Identify and optionally clean outdated packages and stale caches using DNF

All scripts were developed and tested on RHEL 9.5.

---

## 🚀 Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/Emslyyy/sysadmin-automation-pack.git
   cd sysadmin-automation-pack/scripts

2. Make the scripts executable:
   ```bash
   chmod +x *.sh

3. Run each script individually:
   ```bash
   ./secure_user_baseline.sh
   ./service_monitor.sh
   ./package_audit.sh

📌 Note: All scripts require bash and sudo privileges to run properly.
🖼️ Visual output and results can be viewed in the screenshots/ directory.
✍️ Educational Value

Each script was designed to reflect practical skills required in sysadmin and security roles. Areas covered include:

    Hardening user accounts

    Automating service monitoring

    Auditing package states and system hygiene

These tasks simulate hands-on scenarios relevant for:

    CompTIA Network+ / Security+

    RHCSA / RHEL sysadmin roles

    Junior IT or Cybersecurity positions

The project also serves as a starting point for building your own Bash tools and learning how to document automation work effectively.

🧠 Author
Emsly Severe 
Aspiring Cybersecurity Analyst & Junior Sysadmin 
🔗 GitHub: @Emslyyy


Feel free to fork, contribute, or connect.




   
