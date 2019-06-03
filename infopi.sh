echo "Version:" 
echo ""
grep VERSION_ID /etc/os-release
grep Kodi /home/osmc/.kodi/temp/kodi.log | head -3
echo ""
echo "Temperature"
vcgencmd measure_temp
echo "Memory"
free -h
echo ""
echo "USB space"
df -h /media/usb
df -h /media/Elements
echo ""



