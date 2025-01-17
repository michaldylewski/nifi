#!/bin/bash

AWS_NIFI_WEB_HTTP_HOST=$(curl http://checkip.amazonaws.com)

echo "$AWS_NIFI_WEB_HTTP_HOST"

# Instalacja repo

sudo apt install -y apt-transport-https ca-certificates curl software-properties-common unzip
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" -y
sudo apt update
apt-cache policy docker-ce

# Instalacja doocker

sudo apt install -y docker-ce

# Instalacja docker compose

sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo usermod -aG docker ${USER}

source ~/.bashrc
source ~/.profile

#sudo systemctl restart docker.service

# Instalacja NiFi

cd ~ && wget https://raw.githubusercontent.com/michaldylewski/nifi/refs/heads/main/docker-compose.yml

cd ~ && (sed -i -e "s/AWS_NIFI_WEB_HTTP_HOST/$AWS_NIFI_WEB_HTTP_HOST/g" docker-compose.yml)

# Uruchomienie docker-compose w tle
cd ~ && sudo docker-compose up -d

# Możesz dodać inne komendy po uruchomieniu docker-compose
echo "Docker Compose został uruchomiony w tle."
