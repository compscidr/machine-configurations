Hosts File:
  file.blockreplace:
    - name: /etc/hosts
    - marker_start: '#-- start salt managed zone --',
    - marker_end: '#-- end salt managed zone --',
    - source:
      - salt://config/etc/hosts
    - append_if_not_found: True
