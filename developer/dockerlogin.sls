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
