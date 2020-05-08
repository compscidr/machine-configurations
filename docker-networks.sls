frontend-network:
  frontend:
    - docker_network.present
backend-network:
  backend:
     - docker_network.present

stats-network:
  stats:
    - docker_network.present
