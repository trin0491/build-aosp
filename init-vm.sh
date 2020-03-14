#!/bin/bash
if [ $# -lt 1 ]
then
    echo "$0 <ip>"
    exit 1
fi
ip=$1
scp bootstrap.sh root@${ip}:/root/bootstrap.sh
ssh root@${ip} /root/bootstrap.sh
