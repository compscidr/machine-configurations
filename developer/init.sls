include:
  - .nano

developer_packages:
  pkgrepo.managed:
    - name: deb https://packagecloud.io/AtomEditor/atom/any/ any main
    - file: /etc/apt/sources.list.d/atom.list
    - key_url: https://packagecloud.io/AtomEditor/atom/gpgkey

  pkg.installed:
    - pkgs:
      - build-essential
      - virtualenv
      - python-dev
      - libpython-all-dev
      - atom
      - arp-scan
      - nmap

"/home/jason/Templates/Untitled Document":
  file.managed:
    - contents: ''
    - contents_newline: False
