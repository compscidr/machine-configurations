#!/bin/bash
sudo salt-run fileserver.update
sudo salt '*' state.apply

