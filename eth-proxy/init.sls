eth-proxy:
  user.present:
    - createhome: False

create_dir:
  file.directory:
    - name: /opt/eth-proxy
    - makedirs: True
    - user: eth-proxy
    - mode: 755

git-eth-proxy:
  git.latest:
    - name: https://github.com/Atrides/eth-proxy.git
    - rev: master
    - target: /opt/eth-proxy
    - force_reset: True

config:
  file.managed:
    - name: /opt/eth-proxy/eth-proxy.conf
    - source: salt://eth-proxy/eth-proxy.conf

venv:
  virtualenv.managed:
    - name: /opt/eth-proxy/venv
    - system_site_packages: False
    - requirements: salt://eth-proxy/requirements.txt

eth-proxy_upstart:
  file.managed:
    - name: /etc/systemd/system/eth-proxy.service
    - user: root
    - group: root
    - mode: 644
    - source: salt://eth-proxy/eth-proxy.service
    - template: jinja

eth-proxy_service:
  service:
    - name: eth-proxy
    - running
    - require:
      - file: eth-proxy_upstart
