# https://github.com/jorgebucaran/awesome-fish
# https://github.com/oh-my-fish/oh-my-fish
# https://github.com/oh-my-fish/theme-bobthefish

fish-packages:
  pkg.installed:
    - pkgs:
      - fish
      - curl
      - fonts-powerline   # fonts for the statusbar

oh-my-fish:
  cmd.run:
    - name: "curl -L https://get.oh-my.fish | fish -y"
    - runas: jason
    - unless: "fish -c 'omf list'"

bob-the-fish:
  cmd.run:
    - name: "fish -c 'omf install bobthefish'"
    - runas: jason
    - unless: "fish -c 'omf list | grep bobthefish'"
