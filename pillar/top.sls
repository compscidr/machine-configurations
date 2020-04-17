base:
  'master.jasonernst.com':
    - docker-containers
    - nvidia
    - go
  '*':
    - docker-login
