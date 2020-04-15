#!/bin/bash

# get salt
sudo hostnamectl set-hostname master.jasonernst.com
curl -s https://bootstrap.saltstack.com | sudo bash -s -- -M -x python3 stable 2019.2

# get pygit so we can use the github repo for hosting
sudo apt-get install -y python-pygit2

sudo cp config/99-master-gitfs.conf /etc/salt/master.d
sudo cp config/99-master-address.conf /etc/salt/minion.d

sudo service salt-master restart
sudo service salt-minion restart

# will need to accept the minion keys here
