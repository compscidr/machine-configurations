base:
  'master.jasonernst.com':
    - docker-containers
    - nvidia
  'jason-ubuntu-desktop':
    - snaps
  'jason-asus-ubuntu':
    - snaps
  '*':
    - docker-login
    - go
    - collectd
