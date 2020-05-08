base:

  'master.jasonernst.com':
    - master
    - amdgpu
    - docker        # assumes we have https://github.com/saltstack-formulas/docker-formula
    - docker-networks
    - docker.containers
    - developer
    - website
    - minecraft
    - eth-miner

  'jason-ubuntu-desktop':
    - ipfs
    - hosts
    - terraform
    - conky

  'jason-asus-ubuntu':
    - ipfs
    - hosts

  '*':
    - developer
    - packages      # assumes we have https://github.com/saltstack-formulas/packages-formula
    - docker        # assumes we have https://github.com/saltstack-formulas/docker-formula
    - collectd      # assumes we have https://github.com/compscidr/collectd-formula
    - collectd.syslog
    - collectd.interface
    - collectd.write_graphite
    - collectd.df
    - collectd.processes
