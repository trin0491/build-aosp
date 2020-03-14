#!/bin/bash
adduser --uid 1000 --gecos "Richard Priestley" richard
mkdir /home/richard/.ssh
cp /root/.ssh/authorized_keys /home/richard/.ssh
chown -R richard:richard /home/richard/.ssh
chmod 0700 /home/richard/.ssh
chmod 0600 /home/richard/.ssh/authorized_keys
