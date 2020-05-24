#!/bin/bash
set -e

name=build 
region=lon1

doctl compute volume create ${name} --region ${region} --size 250Gib --fs-type ext4 --fs-label ${name} \
    --desc "Build Block Storage"