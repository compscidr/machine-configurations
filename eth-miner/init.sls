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

eth-miner-repo:
  pkgrepo.managed:
    - ppa: ethereum/ethereum
    - ppa: ethereum/ethereum-dev
    pkg.installed:
      - pgks:
        - ethereum
        - ethminer
