# 🛡️ Sysadmin Automation Pack (RHEL 9.5)

> **A lightweight set of Bash scripts to automate system hardening, monitoring, and package auditing on Red Hat Enterprise Linux 9.5. Built for hands-on learners and junior sysadmins looking to level up their Linux administration and scripting skills.**

![Project Status](https://img.shields.io/badge/Project%20Status-Active-brightgreen)
![RHEL](https://img.shields.io/badge/Red%20Hat-RHEL%209.5-EE0000)
![Bash](https://img.shields.io/badge/Language-Bash-4EAA25)
![Security](https://img.shields.io/badge/Focus-Security%20Hardening-d63384)
![Automation](https://img.shields.io/badge/Type-Automation-blue)

---

## 📁 Repository Structure
```
sysadmin-automation-pack/
├── scripts/
│   ├── secure_user_baseline.sh
│   ├── service_monitor.sh
│   └── package_audit.sh
├── screenshots/
│   ├── secure_user_result.png
│   ├── service_monitor_result.png
│   ├── package_audit_result.png
│   ├── package_audit_result_and_cleanup.png
│   ├── locking_unused_accounts.png
│   ├── vim_secure_user_baseline.png
│   └── monitoring_service_with_crontab.png
├── README.md
└── LICENSE
```

---

## 🔧 Project Overview

This toolkit contains three foundational scripts designed to simulate real-world sysadmin tasks and demonstrate essential Linux administration skills. Each script addresses critical aspects of system security, monitoring, and maintenance that are essential in enterprise environments.

**Core Components:**
1. **User Security Baseline** – Lock unused system accounts, enforce password policies, and create hardened user templates
2. **Service Monitor** – Track and restart critical services (e.g. SSH, firewalld) using systemctl + cron
3. **Package Audit Script** – Identify and optionally clean outdated packages and stale caches using DNF

All scripts were developed and tested on **Red Hat Enterprise Linux 9.5** and demonstrate production-ready automation techniques.

---

## 🚀 Getting Started

### Prerequisites
- Red Hat Enterprise Linux 9.5 or compatible distribution
- Bash shell environment
- sudo privileges for system modifications
- Basic understanding of Linux administration

### Quick Deployment
1. **Clone the repository:**
   ```bash
   git clone https://github.com/Emslyyy/sysadmin-automation-pack.git
   cd sysadmin-automation-pack/scripts
   ```

2. **Make the scripts executable:**
   ```bash
   chmod +x *.sh
   ```

3. **Run each script individually:**
   ```bash
   ./secure_user_baseline.sh
   ./service_monitor.sh
   ./package_audit.sh
   ```

📌 **Note:** All scripts require bash and sudo privileges to run properly.

🖼️ **Visual documentation:** All script outputs and results can be viewed in the `screenshots/` directory.

---

## 🛡️ Script Implementation & Results

### Script 1: User Security Baseline

**Purpose:** Harden user accounts and implement security baselines across the system.

![Secure User Baseline Script](https://github.com/user-attachments/assets/35233cfc-d314-45e7-a6df-fbac55a3d184)

*Script development and configuration in vim editor*

**Key Features:**
- Lock unused system accounts (games, ftp, mail, etc.)
- Enforce password complexity requirements
- Set account lockout policies
- Create hardened user templates
- Audit existing user permissions

![User Account Locking](https://github.com/user-attachments/assets/7dd9310f-6b53-41a9-b45a-1f4c905b3f35)

*Automated locking of unnecessary system accounts*

**Security Improvements:**
- Reduces attack surface by disabling unused accounts
- Implements password policies aligned with security standards
- Creates audit trail for user account changes
- Establishes baseline security configuration

![image](https://github.com/user-attachments/assets/24252f29-90d4-4a39-be4f-deab0e5abd52)
*Successful execution showing hardened user security baseline*

### Script 2: Service Monitor

**Purpose:** Automated monitoring and management of critical system services.

**Monitoring Capabilities:**
- Track SSH daemon status and availability
- Monitor firewalld service health
- Automatic service restart on failure
- Logging of service status changes
- Integration with cron for scheduled monitoring

![image](https://github.com/user-attachments/assets/0acf6ba3-2157-46e4-b658-1e65df7499f7)
*Real-time service monitoring output showing system health*

**Automation Features:**
- Proactive service health checking
- Automatic remediation of failed services
- Detailed logging for troubleshooting
- Configurable monitoring intervals
- Email notifications on service failures

![image](https://github.com/user-attachments/assets/4aedd712-b170-4435-97dd-1de1e5f6010d)
*Automated service monitoring integrated with cron scheduling*

**Production Benefits:**
- Minimizes service downtime
- Reduces manual intervention requirements
- Provides early warning of system issues
- Maintains service availability standards

### Script 3: Package Audit & Management

**Purpose:** Comprehensive package management and system hygiene maintenance.

**Audit Capabilities:**
- Identify outdated packages requiring updates
- Detect orphaned packages no longer needed
- Analyze package dependencies and conflicts
- Generate detailed package inventory reports
- Clean package caches and temporary files

![Package Audit Results](https://github.com/user-attachments/assets/74c4d9d4-4963-4d63-97ae-d3424ead81e0)

*Comprehensive package audit showing system package status*

**Maintenance Features:**
- Automated package cleanup routines
- Dependency resolution and optimization
- Security update identification
- Disk space recovery through cache cleaning
- Package installation history tracking

![Package Cleanup](https://github.com/user-attachments/assets/4d4193ba-011a-432b-a19a-a6c2fda92789)

*Package cleanup execution showing space recovery and optimization*

**System Benefits:**
- Maintains optimal system performance
- Reduces security vulnerabilities
- Optimizes disk space utilization
- Ensures package consistency and integrity
- Facilitates compliance reporting

---

## 🔍 Technical Implementation Details

### Script Architecture

**Common Design Patterns:**
```bash
#!/bin/bash
# Error handling and logging
set -euo pipefail
exec 1> >(tee -a /var/log/automation.log)
exec 2>&1

# Function definitions
log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

# Main execution with error handling
main() {
    log_message "Starting automation script..."
    # Implementation logic
    log_message "Script completed successfully"
}

main "$@"
```

**Security Considerations:**
- Input validation and sanitization
- Privilege escalation controls
- Comprehensive logging and audit trails
- Rollback mechanisms for critical changes
- Configuration backup before modifications

### Integration & Scheduling

**Cron Integration:**
```bash
# Daily security baseline check
0 2 * * * /opt/scripts/secure_user_baseline.sh

# Service monitoring every 5 minutes
*/5 * * * * /opt/scripts/service_monitor.sh

# Weekly package audit
0 1 * * 0 /opt/scripts/package_audit.sh
```


## 🛠️ Troubleshooting & Support

### Common Issues

| Issue | Symptom | Solution |
|-------|---------|----------|
| **Permission Denied** | Script fails with access errors | Run with sudo or check file permissions |
| **Service Not Found** | systemctl commands fail | Verify service names and availability |
| **Package Manager Lock** | DNF operations fail | Wait for other package operations to complete |
| **Log File Errors** | Cannot write to log files | Check log directory permissions |
| **Cron Job Failures** | Scheduled tasks not executing | Verify cron service and user permissions |




[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0077B5?style=flat-square&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/emsly-s-482794196)  
[![GitHub](https://img.shields.io/badge/GitHub-Follow-181717?style=flat-square&logo=github&logoColor=white)](https://github.com/Emslyyy)  
📧 [slycyber7@gmail.com](mailto:slycyber7@gmail.com)

---

<p align="center">
  ⭐️ If this automation pack helped you level up your Linux skills, consider giving it a star!
</p>
