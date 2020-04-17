keybase:
  cmd.run:
    - name: |
        curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
        apt install ./keybase_amd64.deb
    - require:
      - pkg: curl
#    - unless: ''
