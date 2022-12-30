#!/bin/bash
echo
echo "================================================================"
echo "| Download Fedora37-1.7 cloud image store in Originals directory"
wget https://download.fedoraproject.org/pub/fedora/linux/releases/37/Cloud/x86_64/images/Fedora-Cloud-Base-37-1.7.x86_64.qcow2
mkdir -p Originals
mv Fedora-Cloud-Base-37-1.7.x86_64.qcow2 Originals/
#
echo
echo "===================="
echo "Operation Successful"
