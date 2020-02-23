#-------
# Important to set the hostname when starting this container since the salt states
# depend on the hostname
FROM compscidr/ubuntu-salt-minion:0.1.1

COPY scripts/minion-setup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/minion-setup.sh
ENTRYPOINT ["minion-setup.sh"]

#-------
