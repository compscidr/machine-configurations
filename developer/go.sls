# todo - replace this with the versions from the go pillar file
go_download:
  file.managed:
    - source: https://dl.google.com/go/go1.14.1.linux-amd64.tar.gz
    - source_hash: sha256=2f49eb17ce8b48c680cdb166ffd7389702c0dec6effa090c324804a5cac8a7f8
    - name: /opt/go1.14.1.linux-amd64.tar.gz
    - mode: 755

go_extract:
  archive.extracted:
    - name: /opt
    - source: /opt/go1.14.1.linux-amd64.tar.gz
    - source_hash: sha256=2f49eb17ce8b48c680cdb166ffd7389702c0dec6effa090c324804a5cac8a7f8
    - requires: go_download

go_env:
  cmd.run:
    - name: |
        sed -e 's|/opt/go/bin:||g' -i /etc/environment
        sed -e 's|PATH="\(.*\)"|PATH="/opt/go/bin:\1"|g' -i /etc/environment
    - requires: go_extract
    - unless: 'cat /etc/environment | grep "/opt/go/bin"'

go_variables:
  file.blockreplace:
    - name: /home/jason/.bashrc
    - marker_start: '#-- start go managed zone --'
    - marker_end: '#-- end go managed zone --'
    - content: |
        export GOROOT=/opt/go
        export GOPATH=$HOME/go
        export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
    - append_if_not_found: True
