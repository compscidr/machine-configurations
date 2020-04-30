base:

  '*':
    - developer
    - packages      # assumes we have https://github.com/saltstack-formulas/packages-formula
    - docker        # assumes we have https://github.com/saltstack-formulas/docker-formula

  'master.jasonernst.com':
    - master
    - amdgpu
    - docker.containers
    - developer
    - website
    - minecraft
    - eth-miner

  'jason-ubuntu-desktop':
    - ipfs
    - hosts
    - terraform

  'jason-asus-ubuntu':
    - ipfs
    - hosts
