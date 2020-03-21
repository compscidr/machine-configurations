eth-miner:
  user.present:
    - createhome: False

eth-miner-create_dir:
  file.directory:
    - name: /opt/eth-miner
    - makedirs: True
    - user: eth-miner
    - group: eth-miner
    - mode: 755

ethereum-repo:
  pkgrepo.managed:
    - ppa: ethereum/ethereum
  pkg.latest:
    - name: ethereum

ethminer-download:
  archive.extracted:
    - name: /opt/eth-miner
    - source: https://github.com/ethereum-mining/ethminer/releases/download/v0.18.0/ethminer-0.18.0-cuda-9-linux-x86_64.tar.gz
