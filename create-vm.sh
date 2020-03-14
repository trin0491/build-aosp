#!/bin/bash

set -e

name=cs1
region=lon1
# doctl compute size list
size="s-6vcpu-16gb"  
# doctl compute image list-distribution --public 
image="53893572"
volume="d78e0c6e-65e0-11ea-9d6d-0a58ac14c051"
key="26792748"

# field hack
ip=$(doctl compute droplet list --format "ID,Name,PublicIPv4" | grep ${name} | cut -d' ' -f10)
if [ -z $ip]
then
    ip=$(doctl compute droplet create ${name} --image ${image} --size ${size} --region ${region} --ssh-keys ${key} --volumes ${volume} --wait --format "PublicIPv4" --no-header)
    sleep 20
    scp init-vm.sh root@${ip}:/root/init-vm.sh
    ssh root@${ip} /root/init-vm.sh
fi
echo $ip

