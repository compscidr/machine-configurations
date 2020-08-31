docker:
  install_docker_py: false
  install_pypi_pip: true
  compose_version: 1.25.0 # https://github.com/docker/compose/issues/6339 (remove docker-py)
  python_package: false
  reload_modules: true

cleanup-containers:
  docker_container.absent:
    - names:
      - stellar-core
      - grafana
      - graphite
