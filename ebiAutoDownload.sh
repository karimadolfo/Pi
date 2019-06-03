#!/bin/bash
date
#Move previous magnets file to later make a diff.
mv /home/osmc/scripts/ufc/ebicurrentmagnet.txt /home/osmc/scripts/ufc/ebipreviousmagnet.txt
rm /home/osmc/scripts/ufc/ebitpb.txt
#Download the URL
curl --insecure https://thepiratebay.org/tag/invitational/0/3/0 > /home/osmc/scripts/ufc/ebitpb.txt

#Extract the magnet links
grep -o 'magnet:[^"]*' /home/osmc/scripts/ufc/ebitpb.txt > /home/osmc/scripts/ufc/ebicurrentmagnet.txt

#Extract the differences to get the new only and keep them on a file.
diff /home/osmc/scripts/ufc/ebicurrentmagnet.txt /home/osmc/scripts/ufc/ebipreviousmagnet.txt |grep -o 'magnet:[^"]*' > /home/osmc/scripts/ufc/ebimagnetdiff.txt
cat /home/osmc/scripts/ufc/ebimagnetdiff.txt

#Adding magnet links to Transmission client

while read MAGNET;
	do
		transmission-remote --add --start-paused $MAGNET;
	done < /home/osmc/scripts/ufc/ebimagnetdiff.txt
