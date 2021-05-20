#!/bin/bash

#SHP-SHARP_HDMI
oldcmd=""
while :
do
        cmd=$(/opt/vc/bin/tvservice -n)
        if [[ "$cmd" == *"GSM-LG_TV"* && "$cmd" != "$oldcmd" ]]
        then
                echo starting xbmc
                $(sudo systemctl start mediacenter)
                oldcmd=$cmd
        elif [[ "$cmd" != "$oldcmd" ]] ; then


                echo stopping xbmc
                $(sudo systemctl stop mediacenter)
                oldcmd=$cmd
        fi


        echo $cmd
        sleep 10
done
