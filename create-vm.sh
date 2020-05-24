#!/bin/bash

set -e

name=cs1
region=lon1
# doctl compute size list
size="s-6vcpu-16gb"  
# doctl compute image list-distribution --public 
image="53893572"
volume="a3109932-9db4-11ea-93eb-0a58ac14c0f8"
key="26792748"

# field hack
ip=$(doctl compute droplet list --format "ID,Name,PublicIPv4" | grep ${name} | cut -d' ' -f10)
if [ -z $ip]
then
    ip=$(doctl compute droplet create ${name} --image ${image} --size ${size} --region ${region} --ssh-keys ${key} --volumes ${volume} --wait --format "PublicIPv4" --no-header)
fi
echo $ip

