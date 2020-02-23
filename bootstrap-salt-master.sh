#!/bin/bash

# get salt
sudo hostnamectl set-hostname master.jasonernst.com
curl -L https://bootstrap.saltstack.com -o install_salt.sh
sudo sh install_salt.sh -M -x python3 stable 2019.2
rm install_salt.sh

# get pygit so we can use the github repo for hosting
sudo apt-get install -y python-pygit2

sudo cp master-config/99-master-gitfs.conf /etc/salt/master.d
sudo service salt-master restart
