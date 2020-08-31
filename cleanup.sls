cleanup-containers:
  docker_container.absent:
    - names:
      - stellar-core
      - grafana
      - graphite
