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

# Link the bash scripts
[[ -f /usr/local/bin/build-site ]] || sudo ln ./bin/build-site /usr/local/bin/build-site
[[ -f /usr/local/bin/start-site ]] || sudo ln ./bin/start-site /usr/local/bin/start-site
[[ -f /usr/local/bin/stop-site ]] || sudo ln ./bin/stop-site /usr/local/bin/stop-site
[[ -f /usr/local/bin/update-site ]] || sudo ln ./bin/update-site /usr/local/bin/update-site

