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

backend:
  docker_network.present:
     - driver: bridge

old-salt-repo:
  file.absent:
    - name: /etc/apt/sources.list.d/saltstack.list
    - unless: cat /etc/apt/sources.list.d/saltstack.list | grep 3000

# todo make this use grains in case different os's
salt-repo:
  pkgrepo.managed:
    - name: deb http://repo.saltstack.com/py3/ubuntu/18.04/amd64/3000 bionic main
    - dist: bionic
    - file: /etc/apt/sources.list.d/saltstack.list
    - key_url: https://repo.saltstack.com/py3/ubuntu/18.04/amd64/3000/SALTSTACK-GPG-KEY.pub
    - require:
      - old-salt-repo

salt-master:
  pkg.installed:
    - allow_updates: True

salt-minion:
  pkg.installed:
    - allow_updates: True
