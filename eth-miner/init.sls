eth-miner:
  user.present:
    - createhome: False

create_dir:
  file.directory:
    - name: /opt/eth-miner
    - makedirs: True
    - user: eth-miner
    - group: eth-miner
    - mode: 755
