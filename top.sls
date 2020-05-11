base:

  'master.jasonernst.com':
    - master
    - amdgpu
    - developer
    - website
    - minecraft
#    - eth-miner    # disable for now due to high gpu usage
#    - plex         # disable for now because its not working

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
    - packages          # assumes we have https://github.com/saltstack-formulas/packages-formula
    - docker            # assumes we have https://github.com/saltstack-formulas/docker-formula
    - docker-networks   # must be before docker.containers but after docker
    - docker.containers
    - docker.compose
    - collectd          # assumes we have https://github.com/compscidr/collectd-formula
    - collectd.syslog
    - collectd.interface
    - collectd.write_graphite
    - collectd.df
    - collectd.processes
