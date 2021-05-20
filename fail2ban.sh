echo ""
sudo service fail2ban status
echo ""
echo "####################################"
echo ""
sudo fail2ban-client status sshd
echo ""
echo "####################################"
echo ""
#tail -200 /var/log/fail2ban.log | grep -i "ban "
echo ""
echo "####################################"
