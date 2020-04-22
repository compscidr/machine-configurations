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
      - ssh
      - openjdk-11-jdk          # java sdk
      - build-essential         # g++, c++, etc.
      - atom                    # ide
      - arp-scan                # for ip <-> mac map search
      - nmap                    # determine open ports
      - net-tools               # ifconfig
      - nbtscan                 # netbios scanner
      - speedtest-cli           # bandwidth debugging
      - fish                    # altnerative to bash

include:
  - .nano
  - .templates
  - .go
  - .python
  - .dockerlogin
  - .keybase
  - fish
