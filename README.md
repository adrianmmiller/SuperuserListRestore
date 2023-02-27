# Superuser List Restore

A simple Magisk Module to restore Magisks Superuser list from an existing backup file

*This is a module requested by XDA member @christantoan, who quite rightly asked why, if i had backup and restore modules for MagiskHide/Deny Lists, why wasnt there the same functionality for the Superuser list.*

After explaining that id thought of it plenty of times, but due to my overwhelming fondness for laziness, put it in the Much Later basket, i set about trying to make his Xmas Wish come true...

**PLEASE NOTE:** We (myself, Osm0sis, ipdev and pndwal) all tried to get this backup and restore functionality (along with backup/restore for the magiskhide/deny list - i have modules for that too - see here: [Related Modules](#related-modules)) added natively to Magisk Manager via Magisk's Github, lets just say it was rejected, so here we are...


**What it does/How it works:**

- Loads the backup file from the partner SuperuserListBackup module (/storage/emulated/0/SuperUserList.txt)
- Queries the /data/system/packages.list using the package name from the backup
- Extract the packages matching UID and formats it
- Inserts the UID into magisk.db's policies table with common options (permanent grant, logging and notification)
- Loops until all packages UIDs are in the magisk.db's policies table

The only active file in the entire module is /common/install.sh, and it is commented.

**Usage:**

- Install via Magisk Manager

The module will create a logfile (/storage/emulated/0/SuperUserListRestore.log) on install, which mirrors the information onscreen. If you have any issues, you'll need to start by looking there, and by opening an issue on this repo's Issues

The module will remain installed, unless removed, after the process completes.

It is safe to leave installed and ignored if you like.


**Please note:** the included LICENSE **only** covers the module components provided by the excellent work of Zack5tpg's 
Magisk Module Extended, which is available for here for module creators

https://github.com/Zackptg5/MMT-Extended/

All other work is credited above and **no one may fork or re-present this module as their own for the purposes of trying to 
monetize this module or its content without all parties permission. The module comes specifically without an overall license 
for this intent.**


### Changelog ###

Please see: https://github.com/adrianmmiller/SuperuserListRestore/blob/main/changelog.md

---

### **Related modules:**

MagiskHideDenyBackup: https://github.com/adrianmmiller/MagiskHideDenyBackup

MagiskHideDenyRestore: https://github.com/adrianmmiller/MagiskHideDenyRestore

---

### Project Stats ###

![GitHub release (latest by date)](https://img.shields.io/github/v/release/adrianmmiller/SuperuserListRestore?label=Release&style=plastic)
![GitHub Release Date](https://img.shields.io/github/release-date/adrianmmiller/SuperuserListRestore?label=Release%20Date&style=plastic)
![GitHub Releases](https://img.shields.io/github/downloads/adrianmmiller/SuperuserListRestore/latest/total?label=Downloads%20%28Latest%20Release%29&style=plastic)
![GitHub All Releases](https://img.shields.io/github/downloads/adrianmmiller/SuperuserListRestore/total?label=Total%20Downloads%20%28All%20Releases%29&style=plastic)
