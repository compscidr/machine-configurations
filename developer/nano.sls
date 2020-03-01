nano:
  pkg:
    - installed

/etc/nanorc:
  file.managed:
    - name: /etc/nanorc
    - source: salt://developer/config/nanorc
    - user: root
    - group: root
    - mode: '0644'
