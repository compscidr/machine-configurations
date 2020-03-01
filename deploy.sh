#!/bin/bash
sudo salt-run fileserver.update
sudo salt '*' saltutil.refresh_pillar
sudo salt '*' state.apply

