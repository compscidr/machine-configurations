# jasonernst.com
This server is the mining rig above the washing machine. It sits with a reverse
proxy serving the following in docker containers:
- www.jasonernst.com
- www.p2ptrader.io

and any other web servers I wish to setup.

This means the reverse proxy should forward:
- port 80, 443 for web traffic
- port 22 (ssh)

It also runs the ethereum mining operation I have going on two Radeon GPUs.

This means it requires:
- eth-proxy
- ethminer

It optionally can use
- geth (for full node)

Optionally I sometimes run the following services:
- ipfs full node
- golem node
- tor exit node

To keep the services starting with logging on errors, I use:
- supervisor service

And
- swatchdog

To monitor web traffic, disk usage, etc. I use
- netdata
