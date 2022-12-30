#!/bin/bash
# From the video Cloud Images are Speical
#========================================
if [ $# != 3 ]
    then
        echo 
        echo "!!!!!"
        echo "3 arguments needed. #1 Distribution name, #2 VM ID Num, #3 Storage Space"
        echo "Ubuntu code name: bionic, focal, jammy, kinetic, lunar"
        echo "For cloud images:  18.04, 20.04, 22.04,  22.10,  23.04"
        echo "!!!!!"
        echo
        exit 1
fi
#===========================
CodeTest=0

case "$1" in

bionic) echo "Bionic - 18.04" 
 ((CodeTest++))
 ;;

focal) echo "Focal - 20.04"
 ((CodeTest++))
 ;;

jammy) echo "Jammy - 22.04"
 ((CodeTest++))
 ;;

kinetic) echo "Kinetic - 22.10"
 ((CodeTest++))
 ;;

lunar ) echo "Lunar - 23.04"
((CodeTest++))
 ;;

esac
#===========================
if [ $CodeTest != 1 ]
    then
        echo "Selection didn't work, something went wrong"
        echo
    exit
fi
#===========================
echo
echo "########################################"
echo "|| Setting Machine ID# to $2"
echo "----------------------------------------"
echo "|| Using $3 as target storage space"
echo "########################################"
echo
qm importdisk $2 $1-server-cloudimg-amd64.img $3
#===========================
echo
echo "========================"
echo "| Operations Successful"
echo "========================"
echo
