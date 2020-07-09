eth-miner-group:
  group.present:
    - name: eth-miner

eth-miner-user:
  user.present:
    - name: eth-miner
    - createhome: False
    - groups:
        - eth-miner
        - video

eth-miner-create_dir:
  file.directory:
    - name: /opt/eth-miner
    - makedirs: True
    - user: eth-miner
    - group: eth-miner
    - mode: 755

eth-packages:
  pkg.installed:
    - pkgs:
      - libclang-common-10-dev
      - libclc-amdgcn
      - libclc-dev
      - libclc-r600
      - libllvm10
      - mesa-opencl-icd

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

ethminer_systemd:
  file.managed:
    - name: /etc/systemd/system/ethminer.service
    - user: root
    - group: root
    - mode: 644
    - source: salt://eth-miner/ethminer.service
    - template: jinja

ethminer_service:
  service:
    - name: ethminer
    - running
    - require:
      - file: ethminer_systemd
