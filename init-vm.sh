#!/bin/bash

set -e

fs=/dev/disk/by-id/scsi-0DO_Volume_build
mount=/mnt/build

mkdir -p ${mount}
mount -o discard,defaults ${fs} ${mount}
echo ${fs} ${mount} ext4 defaults,nofail,discard 0 0 | sudo tee -a /etc/fstab

apt-get update > /dev/null
apt-get --assume-yes install git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev libgl1-mesa-dev libxml2-utils xsltproc unzip > /dev/null

