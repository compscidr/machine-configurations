include:
  - .nano

developer_packages:
  pkg.installed:
    - pkgs:
      - build-essential
      - virtualenv
      - python-dev
      - libpython-all-dev
      - atom

templates:
  /home/jason/Templates/Untitled Document:
    file.managed:
      - contents: ''
      - contents_newline: False
