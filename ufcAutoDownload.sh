#!/bin/bash

#Move previous magnets file to later make a diff.
mv currentmagnet.txt previousmagnet.txt

#Download the URL
curl -v --insecure https://thepiratebay.org/tag/ufc/0/3/0 > tpb.txt

#Extract the magnet links
grep -o 'magnet:[^"]*' tpb.txt > currentmagnet.txt

#Extract the differences to get the new only and keep them on a file.
diff currentmagnet.txt previousmagnet.txt |grep -o 'magnet:[^"]*' > magnetdiff.txt
cat magnetdiff.txt

#Adding magnet links to Transmission client

while read MAGNET;
	do
		transmission-remote --add --start-paused $MAGNET;
	done < magnetdiff.txt
