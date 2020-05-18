base:
  'master.jasonernst.com':
    - website-containers
    - nvidia
  'jason-ubuntu-desktop':
    - snaps
  'jason-asus-ubuntu':
    - snaps
  '*':
    - docker
    - docker-login
    - go
    - stats-containers
    - collectd
