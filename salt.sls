old-salt-repo:
  file.absent:
    - name: /etc/apt/sources.list.d/saltstack.list
    - unless: !(cat /etc/apt/sources.list.d/saltstack.list | grep 3000)

# todo make this use grains in case different os's
salt-repo:
  pkgrepo.managed:
    - name: deb http://repo.saltstack.com/py3/ubuntu/18.04/amd64/3000 bionic main
    - dist: bionic
    - file: /etc/apt/sources.list.d/saltstack.list
    - key_url: https://repo.saltstack.com/py3/ubuntu/18.04/amd64/3000/SALTSTACK-GPG-KEY.pub
    - require:
      - old-salt-repo

salt-minion:
  pkg.installed:
    - allow_updates: True
