cd ~/.config/transmission-daemon
cp settings.json settings.BAK
service transmission stop
nano settings.json
service transmission start
service transmission status
