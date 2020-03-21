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

ethminer-repo:
  pkgrepo.managed:
    - ppa: ethereum/ethereum-dev
  pkg.latest:
    - name: ethminer
