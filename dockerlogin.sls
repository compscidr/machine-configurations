python-pip:
  pkg.installed

python-pip3:
  pkg.installed

docker-py:
  pip.installed

docker.login:
  module.run:
    - registries:
      - hub
