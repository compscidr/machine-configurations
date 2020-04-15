docker:
  group.present
video:
  group.present

jason:
  user.present:
    - fullname: Jason Ernst
    - groups:
      - jason
      - sudo
      - video
      - docker

developer_packages:
  pkgrepo.managed:
    - name: deb https://packagecloud.io/AtomEditor/atom/any/ any main
    - file: /etc/apt/sources.list.d/atom.list
    - key_url: https://packagecloud.io/AtomEditor/atom/gpgkey

  pkg.installed:
    - pkgs:
      - ssh
      - net-tools
      - openjdk-11-jdk
      - build-essential
      - virtualenv
      - python-dev
      - libpython-all-dev
      - atom
      - arp-scan
      - nmap
      - nbtscan
      - speedtest-cli

include:
  - .nano
  - .templates
  - .go
