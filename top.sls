base:

  'master.jasonernst.com':
    #- compose
    #- nginx
    #- jasonernst
    include:
      - docker
      - docker.containers

  'jason-ubuntu-desktop':
    - salt.developer.nano
