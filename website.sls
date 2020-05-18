# https://docs.saltstack.com/en/latest/ref/states/all/salt.states.git.html
git-www-jasonernst-com:
  git.latest:
    - name: git@github.com:compscidr/www.jasonernst.com.git
    - branch: master
    - rev: master
    - target: /var/www/www.jasonernst.com/
    - force_reset: True

dev-jasonernst-com:
  file.touch:
    - name: /opt/goblog/test.db
    - makedirs: True

git-dev-jasonernst.com:
  file.absent:
    - name: /var/www/dev.jasonernst.com

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
