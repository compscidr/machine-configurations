#-------
# Important to set the hostname when starting this container since the salt states
# depend on the hostname
FROM compscidr/ubuntu-salt-minion:0.1.0

# Set the salt-master IP addresses. The first one is for containers running on the Internet
# the second is for containers running in the same LAN as master.jasonernst.com.
RUN echo 'master_type: failover\nmaster: \n  - master.jasonernst.com\n  - 10.0.0.116' | tee -a /etc/salt/minion.d/99-master-address.conf

#-------
