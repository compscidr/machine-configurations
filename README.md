# Machine-configurations
This is a collection of machine configurations along with a salt master to
provide a controlled, consistent environment across a variety of machines
with as little work as possible.

## What works:
- [x] simple initial deployment - ideally with a script after a barebones OS has
been installed. 
- [x] segregated secrets from infrastructure scripts so they aren't committed to
repositories.
- [x] ability to move hosted sites around to other machines
- [x] ability to isolate environments of various sites from each other
- [x] ability to not pollute the environment of the main OS
- [x] dev / staging / production evironments for each site
- [x] automatic backup of data (all source should be on github)
- [x] keep a consistent dev environment so that all of my machines can have
similar configurations for common tools
- [x] developer config which can be deployed across new machines when I add them
 with all the tools and configs I find useful
- [x] https on websites
- [x] ethminer
- [x] minecraft server

The salt master is on [master.jasonernst.com](master.jasonernst.com). The salt
master should also be configured to be a salt minion so that it can set itself
up. A variety of websites are hosted on the same server to save money from
getting aws instances. Since the server isn't the most reliable it is super 
important that code is stored on github and the content is regularly backed up
somewhere else.

Everything is run in docker containers with the philosophy of a single process
per container. In order to serve the multiple servers from the same machine, I 
use an nginx reverse proxy. There is a www and dev apache server for each
website. There is also a www and dev php server for each. The reason for this
is so the mapping from the master and dev branch points to different web root
folders for each. The dev folder is located at /var/www/dev.<servername> and
the www is located at `/var/www/www.<servername>`. All of the servers also start
with https enabled by default using letsencrypt. There is a single mysql
container as well. The php servers and the apache servers must be on the same
user defined network in order for the proxying to work correctly. Currently, the
master hosts:
  - https://www.jasonernst.com
  - https://dev.jasonernst.com
  - https://www.p2ptrader.io
  - https://dev.p2ptrader.io

Eventually it would be nice to explore using tools like docker-swarm, kubernetes
or terraform, but I need to figure those tools out first.

## Master Setup
Run the `bootstrap-env.sh` script on `master.jasonernst.com` if setting
it up for the first time. 

To setup the docker minions, run `bootstrap-docker.sh`.

After a minion starts up, check the key and if it
is correct, accept it.

`sudo salt-key -L`

`sudo salt-key -a <key-glob>`

## Minion Setup

Minions can be standalone machines or docker minions. In the case of standalone
machine (does not work on ubuntu 19.10):
```
curl -s https://bootstrap.saltstack.com | sudo bash -s -- -x python3 stable 2019.2
```

On Ubunut 19.10, simply use
```
sudo apt-get install salt-minion
```

Update the config to point to the master:
```
printf 'retry_dns: 0\nmaster_type: failover\nmaster: \n  - master.jasonernst.com\n  - 10.0.0.116\n' | sudo tee /etc/salt/minion.d/99-master-address.conf
sudo service salt-minion restart
```

## TODO:
- [ ] stellar validator (WiP)
- [ ] ethereum full node (WiP)
- [ ] golem
- [ ] ipfs
- [ ] filecoin testnet
- [ ] ubuntu / debian mirror
- [ ] tor node
- [ ] There is a problem with the master restarts, the web servers need to be added
back to backend network with: `docker network connect backend <webserver container>`.
Need to figure out how to fix.
- [ ] For developer setup, need to figure out how to distribute the gpg keys so that
I can easily sign git commits on newly setup machines without rigamarole.
