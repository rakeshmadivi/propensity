#!/bin/bash
set -x
# References:
# 1. https://www.linuxjournal.com/content/everything-you-need-know-about-linux-containers-part-ii-working-linux-containers-lxc


sudo apt-get install lxc liblxc1
#sudo apt-get install lxc libvirt-clients debootstrap

# Configure environment
echo Users uid and gid in sub{uid,gid}
cat /etc/sub{uid,gid}

# Output:
# rakesh:100000:65536
# rakesh:100000:65536
confdir=${HOME}/.config/lxc
# Create lxc configuration directory
mkdir -p $confdir 

# Copy default lxc configuration file into above directory
cp /etc/lxc/default.conf $confdir

# Append user and group ids as follows to the default configuration

echo "lxc.id_map = u 0 100000 65536" >> $confdir/default.conf
echo "lxc.id_map = g 0 100000 65536" >> $confdir/default.conf

: '
Example Configuration
lxc.network.type = veth
lxc.network.link = lxcbr0
lxc.network.flags = up
lxc.network.hwaddr = 00:16:3e:xx:xx:xx
lxc.id_map = u 0 100000 65536
lxc.id_map = g 0 100000 65536
'

# Append following line to /etc/lxc/lxc-usernet file
sudo sh -c "echo ${USER} veth lxcbr0 10 > /etc/lxc/lxc-usernet"

# Download lxc container
# Key Server Pools: https://sks-keyservers.net/overview-of-pools.php
# Working pgp server is: ipv4.pool.sks-keyservers.net
# set DOWNLOAD_KEYSERVER=ipv4.pool.sks-keyservers.net

# DOWNLOAD_KEYSERVER=ipv4.pool.sks-keyservers.net sudo lxc-create -t download -n example-container 

# Create container
sudo lxc-create -t download -n my-container

