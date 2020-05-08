frontend:
  docker_network.present:
    - driver: bridge

backend:
  docker_network.present:
    - driver: bridge

stats:
  docker_network.present:
    - driver: bridge
