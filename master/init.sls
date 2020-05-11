master-config:
  file.managed:
    - name: /etc/salt/master.d/99-master-gitfs.conf
    - source: salt://master/99-master-gitfs.conf

# make sure the reactor file is in place on the master
fileserver-reactor:
  file.managed:
    - name: /srv/reactor/update_fileserver.sls
    - source: salt://master/reactor/update_fileserver.sls
    - makedirs: True

salt-master-service:
  service:
    - name: salt-master
    - running
    - require:
      - file: master-config

frontend:
  docker_network.present:
     - driver: bridge
     - requires:
       - docker
       - docker.install

backend:
   docker_network.present:
     - driver: bridge
     - requires:
       - docker
       - docker.install
