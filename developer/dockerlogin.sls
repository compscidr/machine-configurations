docker-apt-packages:
  pkg.installed:
    - pkgs:
      - python-pip
      - python3-pip

docker-pip-packages:
  pip.installed:
      - name: docker-py

docker.login:
  module.run:
    - registries:
      - hub

# todo copy file to all users home directories hidden folder
/home/jason/.docker/config.json:
  file.managed:
    - source: /root/.docker/config.json
    - user: jason
    - group: jason
    - require:
      - docker.login
