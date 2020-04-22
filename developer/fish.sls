# https://github.com/jorgebucaran/awesome-fish
# https://github.com/oh-my-fish/oh-my-fish
# https://github.com/oh-my-fish/theme-bobthefish

fish-packages:
  pkg.installed:
    - pkgs:
      - fish
      - curl

oh-my-fish:
  cmd.run:
    - name: "curl -L https://get.oh-my.fish | fish"
    - unless: "fish -c omf list"
