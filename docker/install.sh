#!/bin/bash

# To delete old packages
# for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
#
# Add Docker's official GPG key:
# See https://docs.docker.com/engine/install/ubuntu/
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |
    sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
sudo apt-get update

# Install the packages (inculding the rootless setup):
# See https://docs.docker.com/engine/security/rootless/
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin \
    docker-compose-plugin uidmap dbus-user-session systemd-container docker-ce-rootless-extras

# Set up rootless mode, TODO: may want to check
# https://gist.github.com/espresso3389/a4aeeb1ce9d12c2b0d8b7409eed62e8c
# systemctl restart apparmor.service

# Note that in order to run docker you need to be in a docker group, which you
# can switch by:
#  newgrp docker
