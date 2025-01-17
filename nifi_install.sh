#!/bin/bash

IP=$(curl http://checkip.amazonaws.com)

echo "$IP"

#sed "s/IP/$IP/" nsupdate.txt | nsupdate
# Instalacja repo

sudo apt install -y apt-transport-https ca-certificates curl software-properties-common unzip
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
apt-cache policy docker-ce

# Instalacja doocker

sudo apt install -y docker-ce

# Instalacja docker compose

sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo usermod -aG docker ${USER}

exec bash
