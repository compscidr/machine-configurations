development:
  'dev.www*':
    - apache

staging:
  'staging.www*':
    - apache

production:
  'www*':
    - apache

developer:

'jason-ubuntu-desktop':
  - match: list
  - developer
