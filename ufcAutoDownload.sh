#!/bin/bash
date
#Move previous magnets file to later make a diff.
mv /home/osmc/scripts/ufc/currentmagnet.txt /home/osmc/scripts/ufc/previousmagnet.txt
rm /home/osmc/scripts/ufc/tpb.txt
#Download the URL
curl --insecure https://thepiratebay.org/tag/ufc/0/3/0 > /home/osmc/scripts/ufc/tpb.txt

#Extract the magnet links
grep -o 'magnet:[^"]*' /home/osmc/scripts/ufc/tpb.txt > /home/osmc/scripts/ufc/currentmagnet.txt

#Extract the differences to get the new only and keep them on a file.
diff /home/osmc/scripts/ufc/currentmagnet.txt /home/osmc/scripts/ufc/previousmagnet.txt |grep -o 'magnet:[^"]*' > /home/osmc/scripts/ufc/magnetdiff.txt
cat /home/osmc/scripts/ufc/magnetdiff.txt

#Adding magnet links to Transmission client

while read MAGNET;
	do
		transmission-remote --add --start-paused $MAGNET;
	done < /home/osmc/scripts/ufc/magnetdiff.txt
