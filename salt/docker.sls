install_docker-py:
  pip.installed:
    - name: docker-py

nginx-proxy:
  docker_container.run:
    - name: nginx-proxy
    - image: jwilder/nginx-proxy
    - skip_translate: volumes
    - volumes: {binds=['/etc/nginx/certs', '/etc/nginx/vhost.d', '/usr/share/nginx/html', '/var/run/docker.sock:/tmp/docker.sock:ro']}
    - port_bindings:
      - 80:80 
      - 443:443
    - entrypoint: "/app/docker-entrypoint.sh"
    - detach: True
    - replace: True
