python-pip:
  pkg.installed

python3-pip:
  pkg.installed

docker-py:
  pip.installed

docker.login:
  module.run:
    - registries:
      - hub
