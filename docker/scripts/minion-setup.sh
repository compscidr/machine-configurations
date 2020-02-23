#!/bin/bash
printf "master_type: failover\nmaster:\n  - master.jasonernst.com\n  - 10.0.0.116\nid: $(hostname)" > /etc/salt/minion.d/99-master-address.conf
# service salt-minion restart

# Run the Salt Minion and do not detach from the terminal.
# This is important because the Docker container will exit whenever
# the CMD process exits.
/usr/bin/salt-minion
