mv /home/osmc/scripts/currentseries.txt /home/osmc/scripts/previousseries.txt
rm /home/osmc/scripts/series.txt
wget https://showrss.info/user/212992.rss
grep -o 'magnet:[^"]*' /home/osmc/scripts/212992.rss > /home/osmc/scripts/currentseries.txt
diff /home/osmc/scripts/currentseries.txt /home/osmc/scripts/previousseries.txt | grep -o 'magnet:[^"]*' > /home/osmc/scripts/seriesdiff.txt

#Adding magnet links to Transmission client
while read MAGNET;
	do
		transmission-remote --add --start-paused $MAGNET;
	done < /home/osmc/scripts/seriesdiff.txt
