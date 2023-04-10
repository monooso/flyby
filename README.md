# Flyby
An experiment in self-hosting multiple Phoenix applications on a basic Digital Ocean droplet[^other-providers]. Only a fool would use this for a mission-critical application.

## Motivation
PaaS solutions such as [Fly.io](https://fly.io) are great for serious applications. If that's what you're building, you should use such a service.

For dumb side-projects, Fly isn't so great. The free tier can handle a basic Phoenix application, but beyond that things get very pricey, very quickly.

Flyby is an attempt to fill this gap. You can set it up on a $20 / month DO droplet, and host as many dumb Phoenix applications as your heart desires. Probably. I have no idea, it's an experiment.

## Getting started
At some point I may attempt to automate this, but for now there are a few manual steps to get up and running.

1. Create an Ubuntu 22.10 Digital Ocean droplet. I've been using a 2GB / 2 AMD CPU droplet, but you could probably get away with less.
2. SSH into your fancy new faux server.
3. Install Docker as per [the official documentation](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository). Note that you _do not_ want Docker Desktop.
4. Clone this repository: `git@github.com:monooso/flyby.git`.
5. Launch your digital empire: `cd flyby && docker compose up -d`.

[^other-providers]: Other hosting companies are available. I've only tried this on Digital Ocean, but there's no reason why it wouldn't work on Hetzner, Linode, etc.
