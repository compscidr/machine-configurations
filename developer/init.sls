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
    - shell: /usr/bin/fish

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
      - tmux
      - openjdk-11-jdk          # java sdk
      - build-essential         # g++, c++, etc.
      - atom                    # ide
      - arp-scan                # for ip <-> mac map search
      - nmap                    # determine open ports
      - net-tools               # ifconfig
      - traceroute              # traceroute
      - nbtscan                 # netbios scanner
      - speedtest-cli           # bandwidth debugging

include:
  - .nano
  - .templates
  - .go
  - .python
  - .dockerlogin
  - .keybase
  - .fish
