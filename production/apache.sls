apache2:
  pkg.installed

apache2 Service:
  service.running:
    - name: apache2
    - enable: True
    - require:
      - pkg: apache2


