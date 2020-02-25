/usr/local/bin/docker-compose:
    file.managed:
        - user: root
        - group: root
        - mode: 0755
        - source: https://github.com/docker/compose/releases/download/1.24.0/docker-compose-Linux-x86_64
        - source_hash: bee6460f96339d5d978bb63d17943f773e1a140242dfa6c941d5e020a302c91b

/etc/systemd/system/docker-compose@.service:
    file.managed:
        - user: root
        - group: root
        - mode: 0644
        - source: salt://docker/compose-systemd.service

Reload systemd:
    cmd.run:
        - name: sudo systemctl daemon-reload
        - onchanges:
            - file: /etc/systemd/system/docker-compose@.service

/etc/docker/compose:
    file.directory:
        - user: root
        - group: root
        - mode: 0755
        - makedirs: True
