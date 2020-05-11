stats:
  docker_network.present:
    - driver: bridge
    - require:
      - docker
