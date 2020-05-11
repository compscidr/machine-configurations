# docker-apt-packages-install:
#  pkg.installed:
#    - pkgs:
#      - gnupg2                  # required for docker login to work
#      - python-pip
#      - python3-pip
#
# docker-apt-packages-uninstall:
#  pkg.removed:
#    - pkgs:
#      - docker.io
#
# # note pip docker package seems to have superseeded docker-py. DO NOT install
# # docker-py or it will break docker-compose.
# docker-pip-packages:
#  pip.installed:
#      - name: docker
#      - reload_modules: True
#
# docker-compose-pip-packages:
#  pip.installed:
#      - name: docker-compose
#
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
    - onchanges:
      - docker.login
