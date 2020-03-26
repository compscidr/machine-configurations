ipfs_desktop:
  pkg.installed:
    - sources:
      - ipfs-desktop: http://github.com/ipfs-shipyard/ipfs-desktop/releases/download/v0.10.4/ipfs-desktop-0.10.4-linux-amd64.deb

ifps_systemd:
  file.managed:
    - name: /etc/systemd/system/ipfs.service
    - user: root
    - group: root
    - mode: 644
    - source: salt://ipfs/ipfs.service
    - template: jinja

ipfs_service:
  service:
    - name: ipfs
    - running
    - requires: ipfs_systemd
