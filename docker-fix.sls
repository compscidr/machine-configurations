remove-docker-py:
  pip.removed:
    - name: docker-py
    - onlyif: docker-compose --version | grep 1.25.0
    # note: grep will return non-zero if string not found, otherwise zero

remove-docker-compose:
  pip.removed:
    - name: docker-compose
    - require:
      - remove-docker-py

remove-docker:
  pip.removed:
    - name: docker
    - require:
      - remove-docker-py
