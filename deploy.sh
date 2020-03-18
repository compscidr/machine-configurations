#!/bin/bash
# updates the fileserver, refreshes the pillars and applies
# the highstate to all minions
git fetch
git pull
sudo salt-run fileserver.update
sudo salt '*' saltutil.refresh_pillar
sudo salt '*' state.apply

