#!/bin/bash
# From the video Cloud Images are Special
#========================================
if [ $# != 1 ]
    then
        echo 
        echo "!!!!!"
        echo "1 argument needed.  Choose 1 only:"
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
        echo "Download didn't work, something went wrong"
        echo
        exit
fi
#===========================
echo
echo "=================================================================="
echo "| Downloading Ubuntu current/focal, storing in Originals directory"
wget https://cloud-images.ubuntu.com/$1/current/$1-server-cloudimg-amd64.img
mkdir -p Originals
mv $1-server-cloudimg-amd64.img Originals/
#
echo
echo "===================="
echo "Operation Successful"
