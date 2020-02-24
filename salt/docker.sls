install_docker-py:
  pip.installed:
    - name: docker-py

nginx-proxy:
  docker_container.pulled:
    - require
      - pip: docker-py
    - name: jwilder/nginx-proxy
    - tag: latest
    - order: 200

  docker_container.installed:
    - name: nginx-proxy
    - image: jwilder/nginx-proxy:latest
    - mem_limit: None
    - order: 210

  docker_container.running:
    - image: jwilder/nginx-proxy:latest
    - volumes:
      - /etc/nginx/certs
      - /etc/nginx/vhost.d
      - /usr/share/nginx/html
      - /var/run/docker.sock:/tmp/docker.sock:ro
    - port_bindings:
      - 80:80 
      - 443:443
    - detach: True
    - order: 211
