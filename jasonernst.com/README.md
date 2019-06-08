# jasonernst.com
This server is the mining rig above the washing machine. This is a vagrant setup that tries to reproduce the environment for this machine in case in ever shits the bed.

There is an nginx reverse proxy serving the following websites:
- www.jasonernst.com
- www.p2ptrader.io

and any other web servers I wish to setup. Both are running with https using certs from lets'encrypt. It's currently forwarding all port 80 traffic to port 443 and then using the hostname to figure out which virtualhost to show. Ultimately, I'd prefer if these were in docker containers with their own independent setups, however that may prove a bit tricker to setup in the short term since I'll have to figure out how to route potentially more than just port 80/443 traffic to each docker container.

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
