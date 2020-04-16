python_buildpackages:
  pkg.installed:
    - pkgs:
      - build-essential
      - checkinstall
      - libreadline-gplv2-dev
      - libncursesw5-dev
      - libssl-dev
      - libsqlite3-dev
      - tk-dev
      - libgdbm-dev
      - libc6-dev
      - libbz2-dev

# todo make a list of python versions and install all of them alongside the
# main system version
python_download:
  file.managed:
    - source: https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tgz
    - source_hash: md5=48f393a04c2e66c77bfc114e589ec630
    - name: /usr/src/Python-3.6.8.tgz
    - mode: 755

python_extract:
  archive.extracted:
    - name: /usr/src
    - source: /usr/src/Python-3.6.8.tgz
    - source_hash: md5=48f393a04c2e66c77bfc114e589ec630
    - requires: python_download

python_build_install:
  cmd.run:
    - name: "cd /usr/src/Python-3.6.8 && sudo ./configure && sudo make altinstall"
    - requires: python_extract
