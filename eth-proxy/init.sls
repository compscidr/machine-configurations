create_dir:
  file.directory:
    - name: /opt/eth-proxy
    - makedirs: True

git-eth-proxy:
  git.latest:
    - name: https://github.com/Atrides/eth-proxy.git
    - rev: master
    - target: /opt/eth-proxy
    - force_reset: True

config:
  file.managed:
    - name: /opt/eth-proxy/eth-proxy.conf
    - source: salt://eth-proxy/eth-proxy.conf
