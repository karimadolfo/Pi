#!/bin/bash
date
#Move previous magnets file to later make a diff.
mv /home/osmc/scripts/ufc/polariscurrentmagnet.txt /home/osmc/scripts/ufc/polarispreviousmagnet.txt
rm /home/osmc/scripts/ufc/tpb.txt
#Download the URL
curl --insecure https://thepiratebay.org/tag/polaris/0/0/0 > /home/osmc/scripts/ufc/polaristpb.txt

#Extract the magnet links
grep -o 'magnet:[^"]*' /home/osmc/scripts/ufc/polaristpb.txt > /home/osmc/scripts/ufc/polariscurrentmagnet.txt

#Extract the differences to get the new only and keep them on a file.
diff /home/osmc/scripts/ufc/polariscurrentmagnet.txt /home/osmc/scripts/ufc/polarispreviousmagnet.txt |grep -o 'magnet:[^"]*' > /home/osmc/scripts/ufc/polarismagnetdiff.txt
cat /home/osmc/scripts/ufc/polarismagnetdiff.txt

#Adding magnet links to Transmission client

while read MAGNET;
	do
		transmission-remote --add --start-paused $MAGNET;
	done < /home/osmc/scripts/ufc/polarismagnetdiff.txt
