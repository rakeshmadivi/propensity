#!/bin/bash
# Reference: http://troglobit.com/2017/09/30/set-up-a-debian-ubuntu-apt-repository/
sudo mkdir /srv/deb
sudo mkdir /var/www/www.rakeshrepo.com
sudo echo "/srv/deb /var/www/www.rakeshrepo.com none defaults,bind 0 0" >> /etc/fstab

# Install reprepro
sudo apt-get install reprepro
sudo mkdir -p /srv/deb/{debian,ubuntu}/{conf,dists,incoming,indices,logs,pool,project,tmp}
cd /srv/deb
sudo chown -R `whoami` .

# Changing to Debian Distribution
cd debian/conf
mg distributions
