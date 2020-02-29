/etc/docker/compose/www.jasonernst.com/docker-compose.yml:
  file.managed:
    - makedirs: True
    - source: salt://www.jasonernst.com.docker-compose.yml
    - user: root
    - group: root
    - mode: 0644

docker-compose@www.jasonernst.com:
  service.running:
    - enable: True
    - watch:
      - file: /etc/docker/compose/www.jasonernst.com/docker-compose.yml
