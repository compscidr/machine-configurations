#!/bin/bash
sudo hostnamectl set-hostname master.jasonernst.com
curl -L https://bootstrap.saltstack.com -o install_salt.sh
sudo sh install_salt.sh -M
rm install_salt.sh
