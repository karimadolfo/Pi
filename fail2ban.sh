echo ""
sudo service fail2ban status
echo ""
echo "####################################"
echo ""
sudo fail2ban-client status sshd
echo ""
echo "####################################"
echo ""
cat /var/log/fail2ban.log | grep -i "ban "
echo ""
echo "####################################"
