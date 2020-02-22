#!/bin/bash
sudo apt-get install docker.io
sudo usermod -a -G docker jason
exec sg docker newgrp `id -gn`

# nginx reverse proxy
# https://github.com/jwilder/nginx-proxy
docker run --detach \
     --name nginx-proxy \
     --publish 80:80 \
     --publish 443:443 \
     --volume /etc/nginx/certs \
     --volume /etc/nginx/vhost.d \
     --volume /usr/share/nginx/html \
     --volume /var/run/docker.sock:/tmp/docker.sock:ro \
     jwilder/nginx-proxy

# certificate renewal container
# https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion
docker run --detach \
     --name nginx-proxy-letsencrypt \
     --volumes-from nginx-proxy \
     --volume /var/run/docker.sock:/var/run/docker.sock:ro \
     --env "DEFAULT_EMAIL=ernstjason1@gmail.com" \
     jrcs/letsencrypt-nginx-proxy-companion

