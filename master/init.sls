config:
  file.managed:
    - name: /etc/salt/master/master.d/99-master-gifs.conf
    - source: salt://master/99-master-gitfs.conf

salt-master-service:
  service:
    - name: salt-master
    - running
    - require:
      - file: config
