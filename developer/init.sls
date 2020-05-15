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
  pkg.installed:
    - pkgs:
      - curl                    # command line http tool
      - wget                    # command line http tool
      - ssh                     # ssh server
      - tmux                    # multi-pane terminal
      - openjdk-11-jdk          # java sdk
      - build-essential         # g++, c++, etc.
      - autoconf                # auto build tools
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
      - sqlite3                 # good db for integration tests
      - socat                   # sort of like nc but doesn't hang

include:
  - .atom
  - .nano
  - .templates
  - .go
  - .python
  - .dockerlogin
  - .keybase
  - .fish
  - .virtualbox
  - .minikube
