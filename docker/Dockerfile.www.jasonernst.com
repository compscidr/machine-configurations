FROM compscidr/ubuntu-salt-minion:0.1.0

RUN echo 'master: \n  - master.jasonernst.com\n  - 10.0.0.116' | tee -a /etc/salt/minion.d/99-master-address.conf
