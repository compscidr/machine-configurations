install_docker-py:
  pip.installed:
    - name: docker-py

nginx-proxy:
  docker_container.running:
    - require:
      - pip: docker-py
    - image: jwilder/nginx-proxy
    - volumes:
      - /etc/nginx/certs
      - /etc/nginx/vhost.d
      - /usr/share/nginx/html
      - /var/run/docker.sock:/tmp/docker.sock:ro
    - port_bindings:
      - 80:80 
      - 443:443
    - detach: True
