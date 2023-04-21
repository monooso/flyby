#!/usr/bin/env bash

# See https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
sudo apt-get update

sudo apt-get install ca-certificates curl gnupg

sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Install Tailscale
curl -fsSL https://tailscale.com/install.sh | sh
tailscale up --ssh

# Link the bash script
sudo rm -f /usr/local/bin/flyby && sudo ln ./bin/flyby /usr/local/bin/flyby
