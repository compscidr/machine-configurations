frontend:
  docker_network.present:
    - name: frontend

backend:
  docker_network.present:
    - name: backend

# https://docs.saltstack.com/en/latest/ref/states/all/salt.states.git.html
git-www-jasonernst-com:
  git.latest:
    - name: git@github.com:compscidr/www.jasonernst.com.git
    - rev: master
    - target: /var/www/www.jasonernst.com/

git-dev-jasonernst-com:
  git.latest:
    - name: git@github.com:compscidr/www.jasonernst.com.git
    - rev: develop
    - target: /var/www/dev.jasonernst.com/

