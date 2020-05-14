virtualbox_package_repo:
  pkgrepo.managed:
    - name: deb https://download.virtualbox.org/virtualbox/debian/dists/{{ grains.oscodename }} contrib
    - file: /etc/apt/sources.list.d/virtualbox.list
    - key_url: https://www.virtualbox.org/download/oracle_vbox_2016.asc

virtualbox_package:
  pkg.installed:
    - pkgs:
      - virtualbox
