development:
  'web*':
    - apache

staging:
  'web*':
    - apache

production:
  'web*':
    - apache

developer:

'jason-ubuntu-desktop':
  - match: list
  - developer
