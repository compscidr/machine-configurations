stats:
  docker_network:
    present:
      - driver: bridge
    requires:
      - docker
      - docker.install
