#!/bin/bash  
date=`date +%F`
echo $date
tar -zcf /media/Elements/homebackup$date.tgz /home/ >> /home/osmc/scripts/backup.log
