#!/bin/bash
# From the video:  Cloud Images Are Special
#==========================================
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
        echo "Selection didn't work, something went wrong"
        echo
        exit
fi
#===========================

touch $1-server-cloudimg-amd64.img
rm $1-server-cloudimg-amd64.img
#
echo
echo "============================================================"
echo "| 1 of 3 - Retrieving focal-server from Originals directory"
cp Originals/$1-server-cloudimg-amd64.img ./
#
echo "============================================================"
echo "| 2 of 3 - Adding qemu-guest-agent"
virt-customize -a $1-server-cloudimg-amd64.img --install qemu-guest-agent
#
echo "==================================="
echo "| 3 of 3 - Resizing the image"
qemu-img resize $1-server-cloudimg-amd64.img  32g
#
echo
echo "==========================================================="
echo "| All Operations Successful"
echo "| Image is 32GB in size and will have the qemu-guest-agent"
echo "|"
echo "| Use:"
echo "| virt-customize -a focal-server-cloudimg-amd64.img --install <packagename>"
echo "| to further customize the image before import into the VE"
echo "==========================================================="
echo
