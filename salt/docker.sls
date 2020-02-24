install_docker-py:
  pip.installed:
    - name: docker-py

nginx-proxy:
  requires: install_docker-py
  docker_container.running:
    - image: jwilder/nginx-proxy
    - volumes:
      - /etc/nginx/certs
      - /etc/nginx/vhost.d
      - /usr/share/nginx/html
      - /var/run/docker.sock:/tmp/docker.sock:ro
    - port_bindings:
      - 80:80 
      - 443:443
