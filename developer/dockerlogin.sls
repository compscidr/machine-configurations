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

# todo copy file to all users home directories hidden folder
docker-auth:
  file.managed:
    - source: /root/.docker/config.json
    - destination: /home/jason/.docker/config.json
    - user: jason
    - group: jason
    - require: docker.login
