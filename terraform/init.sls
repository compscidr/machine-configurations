terraform_download:
  archive.extracted:
    - source: https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip
    - source_hash: sha256=602d2529aafdaa0f605c06adb7c72cfb585d8aa19b3f4d8d189b42589e27bf11
    - name: /tmp/terraform
    - enforce_toplevel: False

terraform_copy:
  file.managed:
    - source: /tmp/terraform/terraform
    - name: /usr/bin/terraform
    - mode: 755
    - require:
      - archive: /tmp/terraform
