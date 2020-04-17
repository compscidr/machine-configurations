docker-apt-packages:
  pkg.installed:
    - pkgs:
      - python-pip
      - python3-pip

docker-pip-packages:
  pip.installed:
      - docker-py

docker.login:
  module.run:
    - registries:
      - hub

# todo copy file to all users home directories hidden folder
docker-auth:
  file.managed:
    - source: /root/.docker/config.json
    - destination: /home/jason/.docker/config.json
    - user: jason
    - group: jason
    - require: docker.login
