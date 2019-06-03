#!/bin/bash
date
#Move previous magnets file to later make a diff.
mv /home/osmc/scripts/ufc/gotcurrentmagnet.txt /home/osmc/scripts/ufc/gotpreviousmagnet.txt
rm /home/osmc/scripts/ufc/gottpb.txt
#Download the URL
#curl --insecure https://thepiratebay.org/tag/memento/0/0/0 > /home/osmc/scripts/ufc/gottpb.txt
curl --insecure https://thepiratebay.org/search/game%20of%20thrones%20memento/0/99/0 > /home/osmc/scripts/ufc/gottpb.txt
#Extract the magnet links
grep -o 'magnet:[^"]*' /home/osmc/scripts/ufc/gottpb.txt > /home/osmc/scripts/ufc/gotcurrentmagnet.txt

#Extract the differences to get the new only and keep them on a file.
diff /home/osmc/scripts/ufc/gotcurrentmagnet.txt /home/osmc/scripts/ufc/gotpreviousmagnet.txt |grep -o 'magnet:[^"]*' > /home/osmc/scripts/ufc/gotmagnetdiff.txt
cat /home/osmc/scripts/ufc/gotmagnetdiff.txt

#Adding magnet links to Transmission client

while read MAGNET;
	do
		transmission-remote --add --start-paused $MAGNET;
	done < /home/osmc/scripts/ufc/gotmagnetdiff.txt
