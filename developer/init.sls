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
      - curl
      - wget
      - gnupg2                  # required for docker login to work
      - docker.io
      - ssh
      - net-tools               # ifconfig
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
      - docker-compose

include:
  - .nano
  - .templates
  - .go
  - .python
  - .dockerlogin
  - .keybase
