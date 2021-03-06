# https://docs.saltstack.com/en/latest/ref/states/all/salt.states.git.html
www-jasonernst-com:
  file.touch:
    - name: /opt/goblog/prod/test.db
    - makedirs: True

/opt/goblog/prod/uploads:
  file.directory:
    - makedirs: True

/opt/goblog/prod/.env:
  file.managed:
    - contents: |
        client_id={{ pillar['www.jasonernst.com']['client_id'] }}
        client_secret={{pillar['www.jasonernst.com']['client_secret']}}

git-www-jasonernst.com:
  file.absent:
    - name: /var/www/www.jasonernst.com

dev-jasonernst-com:
  file.touch:
    - name: /opt/goblog/dev/test.db
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
