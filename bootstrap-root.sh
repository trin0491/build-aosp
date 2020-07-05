#!/bin/bash

set -e

fs=/dev/disk/by-id/scsi-0DO_Volume_build
mount=/mnt/build
user=richard
user_name="Richard Priestley"

if [ ! -d $mount ]
then
    mkdir -p ${mount}
    mount -o discard,defaults ${fs} ${mount}
    echo ${fs} ${mount} ext4 defaults,nofail,discard 0 0 | sudo tee -a /etc/fstab
fi 

apt-get --assume-yes update > /dev/null
apt-get --assume-yes install git-core gnupg flex bison build-essential zip curl zlib1g-dev \
    gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev \
    lib32z-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig repo > /dev/null

if id ${user} > /dev/null
then
    echo "Not creating user"
else
    adduser --uid 1000 --gecos "${user_name}" "${user}"
    adduser ${user} sudo
    mkdir /home/${user}/.ssh
    cp /root/.ssh/authorized_keys /home/${user}/.ssh
    chown -R ${user}:${user} /home/richard/.ssh
    chmod 0700 /home/${user}/.ssh
    chmod 0600 /home/${user}/.ssh/authorized_keys
fi

if [ ! -d "${mount}/aosp" ]
then
    mkdir -p "${mount}/aosp"
    chown ${user}:${user} "${mount}/aosp"
fi