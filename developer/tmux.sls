/home/jason/.tmux.conf:
  file.managed:
    - source: salt://developer/config/tmux.conf

/home/jason/.tmux.conf.local:
  file.managed:
    - source: salt://developer/config/tmux.conf.local
