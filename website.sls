# https://docs.saltstack.com/en/latest/ref/states/all/salt.states.git.html
git-www-jasonernst-com:
  git.latest:
    - name: git@github.com:compscidr/www.jasonernst.com.git
    - rev: master
    - target: /var/www/html/jasonernst.com/

