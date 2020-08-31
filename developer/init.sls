docker:
  group.present
video:
  group.present

jason:
  user.present:
    - fullname: Jason Ernst
    - groups:
      - jason
      - sudo
      - video
      - docker
    - shell: /bin/bash

include:
  - .packages
  - .atom
  - .nano
  - .templates
  - .go
  - .python
  - .dockerlogin
  - .keybase
  - .fish
  - .virtualbox
  - .minikube
  - .tmux
