#!/bin/bash
# From the video Cloud Images are Speical
#========================================
if [ $# != 2 ]
    then
        echo 
        echo "!!!!!"
        echo "2 arguments are needed. #1 VM ID Num, #2 Storage Space"
        echo "!!!!!"
        echo
        exit 1
fi
#===========================
echo
echo "=================================================="
echo "| Copy Fedora cloud image from Originals directory"
cp Originals/Fedora-Cloud-Base-37-1.7.x86_64.qcow2 ./
#
echo
echo "===================="
echo "| Resizing the image"
qemu-img resize Fedora-Cloud-Base-37-1.7.x86_64.qcow2 32g
#
echo
echo "==============================================================="
echo "| Importing the image to machine number $1, storage $2" 
qm importdisk $1 Fedora-Cloud-Base-37-1.7.x86_64.qcow2 $2
#
echo
echo "===================="
echo "Operation Successful"
