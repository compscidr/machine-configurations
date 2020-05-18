remove-docker-py:
  pip.removed:
    - name: docker-py
    - unless: docker-compose --version | grep 1.25.0

remove-docker-compose:
  pip.removed:
    - name: docker-compose
    - require: remove-docker-py

remove-docker:
  pip.removed:
    - name: docker
    - require: remove-docker-py
