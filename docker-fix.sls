remove-docker-py:
  pip.removed:
    - name: docker-py
    - unless: docker-compose --version | grep 1.25.0
    # note: grep will return non-zero if string not found, otherwise zero

remove-docker-compose:
  pip.removed:
    - name: docker-compose
    - onchanges_in:
      - remove-docker-py

remove-docker:
  pip.removed:
    - name: docker
    - onchanges_in:
      - remove-docker-py
