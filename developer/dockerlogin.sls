docker-apt-packages-install:
  pkg.installed:
    - pkgs:
      - python-pip
      - python3-pip

docker-apt-packages-uninstall:
  pkg.unwanted:
    - pkgs:
      - docker.io

docker-pip-packages:
  pip.installed:
      - name: docker-py

docker-compose-pip-packages:
  pip.installed:
      - name: docker-compose

docker.login:
  module.run:
    - registries:
      - hub
    - unless: 'grep -q "index.docker.io" /home/jason/.docker/config.json'

# todo copy file to all users home directories hidden folder
/home/jason/.docker/config.json:
  file.managed:
    - source: /root/.docker/config.json
    - user: jason
    - group: jason
    - require:
      - docker.login
