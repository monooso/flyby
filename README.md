# Flyby
An experiment in self-hosting multiple Phoenix applications on a basic Digital Ocean droplet[^other-providers]. Only a fool would use this for a mission-critical application.

## Motivation
PaaS solutions such as [Fly.io](https://fly.io) are great for serious applications. If that's what you're building, you should use such a service.

For dumb side-projects, Fly isn't so great. The free tier can handle a basic Phoenix application, but beyond that things get very pricey, very quickly.

Flyby is an attempt to fill this gap. You can set it up on a $20 / month DO droplet, and host as many dumb Phoenix applications as your heart desires. Probably. I have no idea, it's an experiment.

## Quick start

1. Create an Ubuntu 22.10 Digital Ocean droplet. I've been using a 2GB / 2 AMD CPU droplet, but you could probably get away with less.
2. SSH into your fancy new faux server.
3. Clone this repository: `git clone git@github.com:monooso/flyby.git`.
4. Run the bootstrap script: `cd flyby && bash bootstrap.sh`.
5. Set the environment variables (see below).
6. Launch your digital empire: `docker compose up -d`.

## Environment variables
Flyby relies on a couple of environment variables.

- `SSL_CERTIFICATES_EMAIL`: if something goes south with your SSL certificates, LetsEncrypt will send an email to this address ([allegedly](https://github.com/nginx-proxy/acme-companion#step-2---acme-companion)).
- `FLYBY_POSTGRES_PASSWORD`: the PostgreSQL superuser password.

[^other-providers]: Other hosting companies are available. I've only tried this on Digital Ocean, but there's no reason why it wouldn't work on Hetzner, Linode, etc.

## Managing sites

### Adding a site

```bash
cd ~
git clone git@github.com:mycoolusername/mycoolsite.git

# Build and start the site using the helper scripts that bootstrap.sh added to /usr/local/bin

# Build the site. Accepts the directory name, and the generated image name.
# The generated image name should match the `app` image name in the site's `docker-compose.yml`.
# Do not include the tag (we always use `latest`).
build-site mycoolsite mycoolusername/mycoolsite

# Start the site. Runs `docker compose -f ./mycoolsite/docker-compose.yml up -d`.
start-site mycoolsite

# Restarts the flyby containers, so the nginx proxy picks up the new site
cd flyby && docker compose down && docker compose up -d
```

### Updating a site

```bash
cd ~
update-site mycoolsite
```
