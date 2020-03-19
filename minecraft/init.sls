# inspired from: https://github.com/micaelbergeron/salt.minecraft
# should consider using vagrant to help with automation
# also inspired by: http://bobbylikeslinux.net/post/2013/2013-salt-minecraft-fun/
pkg.installed:
  - pkgs:
    - openjdk-11-jre
    - screen

minecraft:
  user.present: []

{% set minecraft = salt['pillar.get']('minecraft') %}

scaffold minecraft directories:
  file.directory:
    - makedirs: yes
    - names:
      - /opt/minecraft/bin
    - user: minecraft
    - mode: 755

download minecraft_server.jar:
  file.managed:
    - source: https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar
    - source_hash: checksum: sha1=bb2b6b1aefcd70dfd1892149ac3a215f6c636b07
    - user: minecraft
    - group: minecraft
    - name: /opt/minecraft/bin/minecraft_server.jar
    - mode: 755
    - require:
      - file: /opt/minecraft/bin

minecraft-upstart:
  file.managed:
    - name: /etc/init/minecraft.conf
    - user: root
    - group: root
    - mode: 644
    - source: salt://minecraft/minecraft.conf
    - template: jinja

minecraft-service:
  service:
    - name: minecraft
    - running
    - require:
      - file: minecraft-upstart
