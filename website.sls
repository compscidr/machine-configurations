frontend:
  docker_network.present:

backend:
  docker_network.present:

# https://docs.saltstack.com/en/latest/ref/states/all/salt.states.git.html
git-www-jasonernst-com:
  git.latest:
    - name: git@github.com:compscidr/www.jasonernst.com.git
    - branch: master
    - rev: master
    - target: /var/www/www.jasonernst.com/
    - force_reset: True

git-dev-jasonernst-com:
  git.latest:
    - name: git@github.com:compscidr/www.jasonernst.com.git
    - branch: develop
    - rev: develop
    - target: /var/www/dev.jasonernst.com/
    - force_reset: True

git-www-p2ptrader-io:
  git.latest:
    - name: git@github.com:compscidr/www.p2ptrader.io.git
    - branch: master
    - rev: master
    - target: /var/www/www.p2ptrader.io/
    - force_reset: True

git-dev-p2ptrader-io:
  git.latest:
    - name: git@github.com:compscidr/www.p2ptrader.io.git
    - branch: develop
    - rev: develop
    - target: /var/www/www.p2ptrader.io/
    - force_reset: True
