#!/bin/bash  
date=`date +%F`
echo $date
tar -zcf /media/usb/homebackup$date.tgz /home/ >> /home/osmc/scripts/backup.log
