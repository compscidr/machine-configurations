eth-miner:
  user.present:
    - createhome: False

eth-miner-create_dir:
  file.directory:
    - name: /opt/eth-miner
    - makedirs: True
    - user: eth-miner
    - groups:
        - eth-miner
        - video
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
    - source_hash: sha512=35e08c7eca64a3595276cbff632d71c4dad355841c86c1838eb6e11068350f3447d31b72d5204547844efd5a193bea7631b21cf5f647acee8584e8e5549d88d8

ethminer_upstart:
  file.managed:
    - name: /etc/systemd/system/ethminer.service
    - user: root
    - group: root
    - mode: 644
    - source: salt://eth-proxy/ethminer.service
    - template: jinja

ethminer_service:
  service:
    - name: ethminer
    - running
    - require:
      - service: eth-proxy
