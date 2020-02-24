apache:
  pkg:
    - installed
    - pkgs:
      - apache2
  service:
    - running
    - enable: True
    - reload: True
