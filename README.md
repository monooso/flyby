# Flyby
An experiment in self-hosting multiple Phoenix applications on a basic Digital Ocean droplet[^other-providers]. Only a fool would use this for a mission-critical application.

## Motivation
PaaS solutions such as [Fly.io](https://fly.io) are great for serious applications. If that's what you're building, you should use such a service.

For dumb side-projects, Fly isn't so great. The free tier can handle a basic Phoenix application, but beyond that things get very pricey, very quickly.

Flyby is an attempt to fill this gap. You can set it up on a $20 / month DO droplet, and host as many dumb Phoenix applications as your heart desires. Probably. I have no idea, it's an experiment.

## Getting started

1. Create an Ubuntu 22.10 Digital Ocean droplet. I've been using a 2GB / 2 AMD CPU droplet, but you could probably get away with less.
2. SSH into your fancy new faux server.
3. Clone this repository: `git clone git@github.com:monooso/flyby.git`.
4. Run the bootstrap script: `cd flyby && bash bootstrap.sh`.
5. Launch your digital empire: `docker compose up -d`.

[^other-providers]: Other hosting companies are available. I've only tried this on Digital Ocean, but there's no reason why it wouldn't work on Hetzner, Linode, etc.
