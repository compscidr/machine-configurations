install_docker-py:
  pip.installed:
    - name: docker-py

nginx-proxy:
  docker_container.run:
    - name: nginx-proxy
    - image: jwilder/nginx-proxy:latest
    - volumes:
      - /etc/nginx/certs
      - /etc/nginx/vhost.d
      - /usr/share/nginx/html
    - binds: /var/run/docker.sock:/tmp/docker.sock:ro
    - port_bindings:
      - 80:80 
      - 443:443
#  nginx-proxy-letsencrypt.run:
#    - name: nginx-proxy-letsencrypt:latest
#    - image: jrcs/letsencrypt-nginx-proxy-companion
#    - binds: /var/run/docker.sock:/tmp/docker.sock:ro
#    - volumes_from: nginx-proxy
#    - environment:
#      - DEFAULT_EMAIL=ernstjason1@gmail.com 
#    - detach: True
#    - replace: True
