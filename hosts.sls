/etc/hosts:
  file.blockreplace:
    - name: /etc/hosts
    - source:
      - salt://config/etc/hosts
    - append_if_not_found: True
