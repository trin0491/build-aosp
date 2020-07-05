#!/bin/bash
if [ $# -lt 1 ]
then
    echo "$0 <ip>"
    exit 1
fi
ip=$1
user=richard
scp bootstrap-root.sh root@${ip}:/root/bootstrap-root.sh
ssh root@${ip} /root/bootstrap-root.sh

scp bootstrap-user.sh ${user}@${ip}:/var/tmp/bootstrap-user.sh
ssh ${user}@${ip} /var/tmp/bootstrap-user.sh
