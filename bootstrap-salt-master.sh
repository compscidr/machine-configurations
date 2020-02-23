#!/bin/bash

# get salt
sudo hostnamectl set-hostname master.jasonernst.com
curl -L https://bootstrap.saltstack.com -o install_salt.sh
sudo sh install_salt.sh -M
rm install_salt.sh

# get pygit so we can use the github repo for hosting
sudo apt-get install -y python-pygit2

printf 'gitfs_remotes:\n  - git@github.com:compscidr/machine-configurations.git' | tee -a /etc/salt/master.d/99-master-gitfs.conf
sudo service salt-master restart
