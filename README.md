# machine-configurations
This is a collection of machine configurations along with a salt master to
provide a controlled, consistent environment across a variety of machines
with as little work as possible.

Goals:
- simple initial deployment - ideally with a script after a barebones OS has
been installed. 
- segregated secrets from infrastructure scripts so they aren't committed to
repositories.
- ability to move hosted sites around to other machines
- ability to isolate environments of various sites from each other
- ability to not pollute the environment of the main OS
- dev / staging / production evironments for each site
- automatic backup of data (all source should be on github)

The salt master will run on `master.jasonernst.com`. 

Since I'm trying to be cheap, this server will also host a bunch of websites.
These websites will be hosted on the same machine, each within a docker
container. In order to do this, there will be an nginx reverse proxy (also
within its own docker container) which automatically picks up new docker
containers exposing ports to it.

There will likely be a few database containers for the websites to interact
with.

The idea is that eventually any of these containers can be swapped onto
other machines, or onto aws if I ever feel like paying money for any of it
to run.

## Master Setup
Run the `bootstrap-salt-master.sh` script on `master.jasonernst.com` if setting
it up for the first time. 


To setup the docker minions, run `bootstrap-docker.sh`.


After a minion starts up, check the key and if it
is correct, accept it.

`sudo salt-key -L`

`sudo salt-key -a <key-glob>`

## Minion Setup

### Standalone Minion
Minions can be standalone machines or docker minions. In the case of standalone
machine:
```
curl -L https://bootstrap.saltstack.com -o install_salt.sh
sudo ./install_salt.sh
echo 'master: master.jasonernst.com' | sudo tee -a /etc/salt/minion.d/99-master-address.conf
```

### Docker minion
`docker build --rm=true -f docker/Dockerfile . -t <servicename>`
`docker run <servicename> --hostname=<hostname>`

### Building the base minion image:
`docker build --rm=true -t compscidr/ubuntu-salt-minion:0.1.0 -f docker/Dockerfile.minion .`
