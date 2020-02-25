/etc/docker/compose/nginx/docker-compose.yml:
  file.managed:
    - makedirs: True
    - source: salt://nginx-docker-compose.yml
    - user: root
    - group: root
    - mode: 0644

docker-compose@nginx:
  service.running:
    - enable: True
    - watch:
      - file: /etc/docker/compose/nginx/docker-compose.yml
