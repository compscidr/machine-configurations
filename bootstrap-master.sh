#!/bin/bash
curl -L https://bootstrap.saltstack.com -o install_salt.sh
sudo sh install_salt.sh -M
iptables -A INPUT -m state --state new \ -m tcp -p tcp --dport 4505 -j ACCEPT
iptables -A INPUT -m state --state new \ -m tcp -p tcp --dport 4506 -j ACCEPT
