Hosts File:
  file.blockreplace:
    - name: /etc/hosts
    - marker_start: '#-- start salt managed zone --'
    - marker_end: '#-- end salt managed zone --'
    - content: |
        10.0.0.116 master
        10.0.0.116 master.jasonernst.com
        10.0.0.116 jasonernst.com
        10.0.0.116 www.jasonernst.com
        10.0.0.116 dev.jasonernst.com
        10.0.0.116 p2ptrader.io
        10.0.0.116 www.p2ptrader.io
        10.0.0.116 dev.p2ptrader.io
    - append_if_not_found: True
