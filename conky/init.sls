conky-all:
  pkg:
    - installed

/home/jason/.config/autostart/conky.desktop:
  file.managed:
    - source: salt://conky/conky.desktop

conky-archive:
  archive.extracted:
    - name: /home/jason
    - source: salt://conky/conky.tar.xz
    - user: jason
    - group: jason
