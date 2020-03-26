ipfs_desktop:
  pkg.installed:
    - sources:
      - ipfs-desktop: http://github.com/ipfs-shipyard/ipfs-desktop/releases/download/v0.10.4/ipfs-desktop-0.10.4-linux-amd64.deb

ifps_autostart:
  file.managed:
    - name: /home/jason/.config/autostart/ipfs-desktop.desktop
    - source: /usr/share/applications/ipfs-desktop.desktop
