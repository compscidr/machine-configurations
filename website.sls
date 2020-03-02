frontend:
  docker_network.present:
    - name: frontend
    - containers:
      - www.jasonernst.com
      - dev.jasonernst.com
      - www.p2ptrader.io
      - dev.p2ptrader.io

backend:
  docker_network.present:
    - name: backend
    - containers:
      - www.jasonernst.com
      - dev.jasonernst.com
      - www.p2ptrader.io
      - dev.p2ptrader.io

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

git-www-p2ptrader-io:
  git.latest:
    - name: git@github.com:compscidr/www.p2ptrader.io.git
    - rev: master
    - target: /var/www/www.p2ptrader.io/

git-dev-p2ptrader-io:
  git.latest:
    - name: git@github.com:compscidr/www.p2ptrader.io.git
    - rev: develop
    - target: /var/www/www.p2ptrader.io/

