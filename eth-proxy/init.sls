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
