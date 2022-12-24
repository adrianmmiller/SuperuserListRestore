#!/system/bin/sh
LogFile="/storage/emulated/0/SuperUserListRestore.log"
ListFile="/storage/emulated/0/SuperUserList.txt"

if [[ -f "$ListFile" && -s "$ListFile" ]]; then
ui_print "Backup file SuperUserList.txt: Found" 2>&1 | tee -a $LogFile
ui_print "Restore of Magisk SuperUser List: Starting..." 2>&1 | tee -a $LogFile
#read /storage/emulated/0/SuperUserList.txt into array and process
while IFS='' read -r package; do
	ui_print "Package: $package" 2>&1 | tee -a $LogFile
	#grep packages.list for packagename and format return to provide just UID
	uid=$(grep $package /data/system/packages.list | cut -f2 -d" ")
	ui_print "Package UID: $uid" 2>&1 | tee -a $LogFile
	#insert UID into policies table with common options (permanent grant, logging and notification)
	sql=$(magisk --sqlite "insert into policies values($uid, 2, 0, 1, 1);")
	#check that sql insertion worked ok
	if [ $? -eq 0 ] ; then
		ui_print "Package UID: $uid inserted into magisk.db: OK" 2>&1 | tee -a $LogFile
	else	
		ui_print "Package UID: $uid inserted into magisk.db: FAILED" 2>&1 | tee -a $LogFile
	fi	
done < "$ListFile"
ui_print "Restore of Magisk SuperUser List: Complete" 2>&1 | tee -a $LogFile
else
ui_print "Backup file SuperUserList.txt: NOT found" 2>&1 | tee -a $LogFile
abort "Restoration cannot continue. Exiting..." 2>&1 | tee -a $LogFile
fi
