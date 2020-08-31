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
    - salt
    - amdgpu
    - ipfs
    - hosts
    - terraform
    - conky
    - eth-miner

  'jason-asus-ubuntu':
    - salt
    - ipfs
    - hosts

  'jason-ThinkPad-P53s':
    - developer.packages

  '*':
    - cleanup

  # '*':
  #   - developer
  #   - packages          # assumes we have https://github.com/saltstack-formulas/packages-formula
  #   - docker-fix
  #   - docker            # assumes we have https://github.com/saltstack-formulas/docker-formula
  #   - docker.compose    # assumes we have https://github.com/saltstack-formulas/docker-formula
  #   - docker-networks   # must be before docker.containers but after docker
  #   - docker.containers
  #   - collectd          # assumes we have https://github.com/compscidr/collectd-formula
  #   - collectd.syslog
  #   - collectd.interface
  #   - collectd.write_graphite
  #   - collectd.df
  #   - collectd.disk
  #   - collectd.processes
  #   - collectd.uptime
  #   - collectd.cpu
  #   - collectd.swap
