PS3='Please enter your choice: '
options=("No port scan after host discovery" "DNS Resolution" "Enables version detection" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "No port scan after host discovery")
            nmap -sn 192.168.1.0/24
		echo "##############################"
		echo "##############################"	
            ;;
        "DNS Resolution")
            nmap -R 192.168.1.0/24
		echo "#############################"
		echo "#############################"
            ;;
        "Enables version detection")
            nmap -sV 192.168.1.0/24
		echo "############################"
		echo "############################"

            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
