base:

  'master.jasonernst.com':
    #- compose
    #- nginx
    #- jasonernst
    - docker
    - docker.containers

  'jason-ubuntu-desktop':
    - salt.developer.nano
