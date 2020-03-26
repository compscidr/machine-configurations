# todo - replace this with the versions from the go pillar file
go_download:
  file.managed:
    - source: https://dl.google.com/go/go1.14.1.linux-amd64.tar.gz
    - source_hash: sha256=2ad2572115b0d1b4cb4c138e6b3a31cee6294cb48af75ee86bec3dca04507676
    - name: /opt/go1.14.1.linux-amd64.tar.gz
    - mode: 755

go_extract:
  archive.extracted:
    - name: /opt
    - source: /opt/go1.14.1.linux-amd64.tar.gz
    - source_hash: sha256=2ad2572115b0d1b4cb4c138e6b3a31cee6294cb48af75ee86bec3dca04507676
    - requires: go_download
