#!/bin/bash

startLoopback() {
    pacat -r --latency-msec=1 -d alsa_input.usb-Kingston_HyperX_7.1_Audio_00000000-00.analog-stereo | pacat -p --latency-msec=1 -d alsa_output.usb-Kingston_HyperX_7.1_Audio_00000000-00.analog-stereo &
}

endLoopback() {
    kill -9 $(pidof pacat)
}

echoMenu () {
    printf "[S] Start Loopback\r\n"
    printf "[P] Pause Loopback\r\n"
    printf "[X] Exit\r\n"
    printf "\r\nSelect Option: "
    read option

    case "$option" in
            "S" | "s" )
                printf "Starting loopback...\r\n"
                startLoopback
            ;;
            "P" | "p" )
                printf "Pausing loopback...\r\n"
                endLoopback
            ;;
            "X" | "x" )
                printf "Exiting...\r\n"
                exit 0
            ;;
    esac            
}


while true; do
    echoMenu
done
