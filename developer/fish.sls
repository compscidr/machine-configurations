fish-packages:
  pkg.installed:
    - pkgs:
      - fish
      - curl

oh-my-fish:
  cmd.run:
    - name: "curl -L https://get.oh-my.fish | fish"
    - unless: |
      fish
      omf list
