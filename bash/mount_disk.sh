#!/bin/bash
# Copyright @ Htut PK <pk.htut@gmail.com>

DISK=$(mount | sed -e '$!d' | head -n1 | cut -d " " -f1)
FOLDER=$(mount | sed -e '$!d' | head -n1 | cut -d " " -f3)
echo "You have mounted $DISK on $FOLDER."

function mount_disk() {
    COMMAND="/usr/local/sbin/mount_ntfs"
    FOLDER1="/Volumes/USBdisk"
    echo "Your disk will be mounted on $FOLDER1."
    mkdir -p $FOLDER1
    sudo $COMMAND $1 $FOLDER1 # here $1 is looking for argument 1
}
    

read -p "Do you want to umount for that disk? <y/N> " prompt
if [[ $prompt =~ [yY](es)* ]]
then
    diskutil umount $DISK
else
    exit 0
fi

sleep 3

read -p "Do you want to mount RW access for that disk? <y/N> " prompt
if [[ $prompt =~ [yY](es)* ]]
then
    mount_disk $DISK # $DISK is argument 1 to pass thru function
else
    exit 0
fi
