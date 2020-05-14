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
      - autoconf
      - atom                    # ide
      - arp-scan                # for ip <-> mac map search
      - dnsutils                # dig
      - iftop                   # network top
      - iotop                   # disk top
      - net-tools               # ifconfig, netstat, arp
      - nmap                    # determine open ports
      - traceroute              # traceroute
      - nbtscan                 # netbios scanner
      - speedtest-cli           # bandwidth debugging
      - sshuttle                # forward ssh through tunnel
      - whois                   # whois
      - sqlite3
      - socat                   # sort of like nc but doesn't hang

include:
  - .nano
  - .templates
  - .go
  - .python
  - .dockerlogin
  - .keybase
  - .fish
