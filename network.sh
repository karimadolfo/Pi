PS3='Please enter your choice: '
options=("No port scan after host discovery" "DNS Resolution" "Enables version detection" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "No port scan after host discovery")
            nmap -sn 192.168.1.0/24
            ;;
        "DNS Resolution")
            nmap -R 192.168.1.0/24
            ;;
        "Enables version detection")
            nmap -sV 192.168.1.0/24
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
