docker-containers:
  lookup:
    nginx_proxy:
      image: jwilder/nginx-proxy:latest
      pull_before_start: true
      remove_before_start: true
      remove_on_stop: false
      runoptions:
        - "--detach"
        - "--name nginx-proxy"
        - "--publish 80:80"
        - "--publish 443:443"
        - "--volume /etc/nginx/certs"
        - "--volume /etc/nginx/vhost.d"
        - "--volume /usr/share/nginx/html"
        - "--volume /var/run/docker.sock:/tmp/docker.sock:ro"

#install_docker-py:
#  pip.installed:
#    - name: docker-py

#nginx-proxy:
#  docker_container.run:
#    - name: nginx-proxy
#    - image: jwilder/nginx-proxy:latest
#    - volumes:
#      - /etc/nginx/certs
#      - /etc/nginx/vhost.d
#      - /usr/share/nginx/html
#    - binds: /var/run/docker.sock:/tmp/docker.sock:ro
#    - port_bindings:
#      - 80:80
#      - 443:443
#  nginx-proxy-letsencrypt.run:
#    - name: nginx-proxy-letsencrypt:latest
#    - image: jrcs/letsencrypt-nginx-proxy-companion
#    - binds: /var/run/docker.sock:/tmp/docker.sock:ro
#    - volumes_from: nginx-proxy
#    - environment:
#      - DEFAULT_EMAIL=ernstjason1@gmail.com 
#    - detach: True
#    - replace: True
