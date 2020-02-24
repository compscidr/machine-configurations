install_docker-py:
  pip.installed:
    - name: docker-py

nginx-proxy:
  docker_container.run:
    - name: nginx-proxy
    - image: jwilder/nginx-proxy
    - volumes:
      - /etc/nginx/certs
      - /etc/nginx/vhost.d
      - /usr/share/nginx/html
    - binds: /var/run/docker.sock:/tmp/docker.sock:ro
    - port_bindings:
      - 80:80 
      - 443:443
#    - entrypoint: "/app/docker-entrypoint.sh forego start -r"
    - detach: True
    - replace: True
  nginx-proxy-letsencrypt.run:
    - name: nginx-proxy-letsencrypt
    - image: jrcs/letsencrypt-nginx-proxy-companion
    - binds: /var/run/docker.sock:/tmp/docker.sock:ro
    - volumes_from: nginx-proxy
    - environment:
      - DEFAULT_EMAIL=ernstjason1@gmail.com 
    - detach: True
    - replace: True
